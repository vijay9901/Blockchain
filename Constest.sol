 pragma solidity >=0.4.21 <0.7.0;


// smart voting application

// creating the contract
contract Contest{
 //declaring variables

// string public contestant;

 

 // function Contest() {
 // 	contestant = 'Tom';
 // }
//declaring constructor
// constructor() public {
//    contestant = 'Tom';
//   }

//creating structure to model the contestant

struct Contestant{
	uint id;
	string name;
	uint voteCount;
}

//use mappoing to get or fetch the contestant details
//mapping (uint => Contestant) public Contestant;

//use mapping to get or fetch the contestant details
	//mapping(uint => Contestant) public contestants;
	mapping(uint => Contestant) public contestants;

//to save the list of users/accounts who already casted vote
mapping(address => bool) public voters;

//add a public state variable to keep track of contestant count
uint public contestantsCount;

event votedEvent (
	uint indexed _contestantId
);


  constructor() public {
		addContestant("Tom");
		addContestant("Jerry");
		addContestant("Sam");
	}

//contestant[1] = 1,tom,0
//adding a function to add contestant
function addContestant (string memory _name) private{
	contestantsCount++;
	contestants[contestantsCount] = Contestant(contestantsCount,_name,0);
}


//for adding vote count here
function vote (uint _contestantId) public{
	// require is a inbuild function from solidity, 
	//if require condition is true, console goes to next line else throws exception
    // restricting the person who already casted the vote
    require(!voters[msg.sender]);
    //require that the vote is casted to a valid contestant
    require(_contestantId >0 && _contestantId <= contestantsCount);

	contestants[_contestantId].voteCount ++;
	voters[msg.sender] = true;

    //trigger the vote event
	emit votedEvent(_contestantId);
}


}
//
// app.contestants(1).then(function(c){contestant = c})
/** 
new code directly copied from tutorial
*/
//Contest.deployed().then(function(instance){app = instance})

// //pragma solidity 0.5.0;
 
// //creating the contract
// contract Contest {
 
// 	//creating strcture to model the contestant
// 	struct Contestant {
// 		uint id;
// 		string name;
// 		uint voteCount;
// 	}
 
// 	//use mapping to get or fetch the contestant details
// 	mapping(uint => Contestant) public contestants;
 
// 	//to save the list of users/accounts who already casted vote
// 	mapping(address => bool) public voters;
 
// 	//add a public state variable to keep track of contestant Count
// 	uint public contestantsCount;
 
// 	event votedEvent (
//         uint indexed _contestantId
//     );
 
//     constructor() public {
// 		addContestant("Tom");
// 		addContestant("Jerry");
// 	}
 
// 	//add a function to add contestant
// 	function addContestant (string memory _name) private {
// 		contestantsCount ++;
// 		contestants[contestantsCount] = Contestant(contestantsCount, _name, 0);
// 	}
 
// 	function vote (uint _contestantId) public {
// 		//restricting the person who already casted the vote
// 		require(!voters[msg.sender]);
// 		//require that the vote is casted to a valid contestant
// 		require(_contestantId > 0 && _contestantId <= contestantsCount);
// 		//increase the contestant vote count
// 		contestants[_contestantId].voteCount ++;
// 		//set the voter's voted status to true
// 		voters[msg.sender] = true;
 
// 		//trigger the vote event
// 		emit votedEvent(_contestantId);
// 	}
// }

// //Constest.deploy().then()