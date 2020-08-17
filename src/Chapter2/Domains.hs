module Chapter2.Domains where

import Data.Char (toUpper)
data Client = GovOrg String
            | Company String Integer Person String
	    | Individual Person Bool
	    deriving Show

data Person = Person String String Gender
	    deriving Show
data Gender = Male | Female | Unknown deriving Show

data TimeMachine = String Double deriving Show 

data Order = Order {p :: Person, t :: [TimeMachine]} deriving Show 

clientName :: Client -> String 
clientName client = case client of
                          GovOrg name                     -> name
                          Company name _ _ _      -> name
                          Individual (Person fNm lNm _) _ -> fNm ++ " " ++ lNm 

companyName :: Client ->  Maybe String
companyName client = case client of
			Company name _ _ _ -> Just name
			_ 		   -> Nothing

data ClientR = GovOrgR { clientRName :: String }
	     | CompanyR { clientRName :: String
	     		, companyId :: String
			, person :: PersonR
			, duty :: String}
             | IndividualR { person :: PersonR }
	     deriving Show

data PersonR = PersonR { firstName :: String
			, lastName :: String
			} deriving Show


nameInCapitals :: PersonR -> PersonR
nameInCapitals p@(PersonR { firstName = initn:rest}) = 
	let newName = (toUpper initn):rest
	in p { firstName = newName }
nameInCapitals p@(PersonR {firstName = ""}) = p


data TimeMachineR = TimeMachineR {name :: String, price :: Double} deriving Show

updatePrice :: TimeMachineR -> Double -> TimeMachineR
updatePrice p@(TimeMachineR { price = oldPrice}) newPrice = 
	let updatedPrice = newPrice
	in p {price = updatedPrice}

isGovOrg (GovOrg _) = True
isGovOrg _ = False

filterGovOrg client = filter isGovOrg client