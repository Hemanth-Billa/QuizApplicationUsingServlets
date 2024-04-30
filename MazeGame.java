	package srinibash_game;
	
	import java.util.Scanner;
	
	public class MazeGame {
		private static Scanner s=new Scanner(System.in);
		private static char temp[][];
		private static int eRow,eCol;
		private static int cRow,cCol,rowLimit,colLimit;//static variables and c means curser
		private char maze[][]=temp;
		private static char character;
	// printing the maze;
	//$$$$$$$$$$$$$$$$$$$$$$$$
	private static void printMaze()
	{
		char temp=' ';
		MazeGame mg=new MazeGame();
		for(int i=0;i<rowLimit;i++)
		{
			System.out.print("\t");
			for(int j=0;j<colLimit;j++)
			{
				//this.maze[cRow][cCol]='x';
				temp=mg.maze[cRow][cCol];				
					mg.maze[cRow][cCol]=character;
				
				System.out.print(mg.maze[i][j]+" ");
				mg.maze[cRow][cCol]=temp;
				//System.out.print(this.maze[i][j]+" ");
			}
			System.out.println();
		}
		System.out.println("\n");
	}
	
	
	//game over condition
	//%%%%%%%%%%%%%%%%%%%%
	private static int gameOver(int eRow,int eCol)
	{
		if(cRow==eRow&&cCol==eCol)
			return 1;
		else return 0;
	}
	
	//this is for checking wall or not 
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	private boolean isWall( int cRow,int cCol)
	{
		this.maze=temp;
		if(this.maze[cRow][cCol]=='#')
			return true;
		else return false;
	}
	//This is a for the set the level and starting rows and columns , ending rows and columns//
	//=========================================================================================
	public void setMaze()
	{
		String choice="";boolean exit=true;
		char character;
		while(exit)
		{
			decoration();
			System.out.println("\tChoose levels\n"
							  +"\t1. EASY\n"
								+"\t2. MEDIUM\n"
							    +"\t3. HARD \n"+"\t4. EXIT\n"+"================================================================\n");
			
			choice=s.next();
			if(choice.equals("1")||choice.equals("2")||choice.equals("3")||choice.equals("4"))
			{
				do	
				{
					
					System.out.print("Choose a character between A-Z (for playing) : ");
					try
					{
						character=s.next().charAt(0);
					}
					catch (Exception e) {
						character='X';
						}
					if(Character.isAlphabetic(character))
						MazeGame.character=Character.toUpperCase(character);
					else
						System.out.println("Invalid character");
					
			}while(!Character.isAlphabetic(character));
		}
			switch(choice)
			{
			case"1":temp=MazeLevel.getLevel1();
				cRow=MazeLevel.getSrow();
				cCol=MazeLevel.getScol();
				rowLimit=MazeLevel.getL1rowlimit();
				colLimit=MazeLevel.getL1collimit();
				eRow=MazeLevel.getErow();
				eCol=MazeLevel.getEcol();
				this.mainMaze();
				break;
			case "2":temp=MazeLevel.getLevel2();
				cRow=MazeLevel.getLevel2srow();
				cCol=MazeLevel.getLevel2scol();
				rowLimit=MazeLevel.getL2rowlimit();
				colLimit=MazeLevel.getL2collimit();
				eRow=MazeLevel.getLevel2erow();
				eCol=MazeLevel.getLevel2ecol();
				this.mainMaze();
				break;
			case "3":temp=MazeLevel.getLevel3();
				cRow=MazeLevel.getLevel3srow();
				cCol=MazeLevel.getLevel3scol();
				rowLimit=MazeLevel.getL3rowlimit();
				colLimit=MazeLevel.getL3collimit();
				eRow=MazeLevel.getLevel3erow();
				eCol=MazeLevel.getLevel3ecol();
				this.mainMaze();
				break;
			case "4":exit=false;System.out.println("\n\n\tGame Terminated Sucessfully");
			break;
				default:System.out.println("\tInvalid Entry");
			}
			
		}
	}
	//main method for moving the character
	//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
	private void mainMaze()
	{
		printMaze();
		//int cRow=2,cCol=0;
		
		while(true)
		{
			guide();
			char key=s.next().charAt(0);
		switch(key)
		{
		case 'a':this.mainMaze(0,-1);//cCol--;
		break;
		case 's':this.mainMaze(1, 0);//cRow++;
		break;
		case 'd':this.mainMaze(0,1);//cCol++;
		break;
		case 'w':this.mainMaze(-1,0);//cRow--;
		break;
		case'x':System.out.println("\n\tBye Bye");
			return;
		}
		if(gameOver(eRow,eCol)==1)
		{	
			printMaze();
			System.out.println("\n\nMission succeed.\n\nYou found the exit.");
			break;
		}
		else 
			printMaze();
			
		}
		//s.close();
	}
	//this is for checking the wall and moving the character through spaces
	//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	private void mainMaze(int r,int c)
	{
		//MazeGame mg=new MazeGame();
		if(!isWall(cRow+r,cCol+c))
				{
			cRow+=r;
			cCol+=c;
				//MazeGame.cRow=cRow;
			    //MazeGame.cCol=cCol;
				}
			else
			System.out.println("\n\tWALL\n");	
	}
	//this is for guide how to play the game
	//*********************************************
	private static void guide()
	{
	
		System.out.println("         ^\r\n"
				         + "         w\r\n"
				         + "     < a s d >\r\n"
				         + "         v");
		System.out.println("\n     [EXIT-X]");
	}
	private static void decoration()
	{
		System.out.println("88888888888888888888888888888888888888888888888888888888888888888888888\r\n"
				+ "88.._|      | `-.  | `.  -_-_ _-_  _-  _- -_ -  .'|   |.'|     |  _..88\r\n"
				+ "88   `-.._  |    |`!  |`.  -_ -__ -_ _- _-_-  .'  |.;'   |   _.!-'|  88\r\n"
				+ "88      | `-!._  |  `;!  ;. _______________ ,'| .-' |   _!.i'     |  88\r\n"
				+ "88..__  |     |`-!._ | `.| |_______________||.\"'|  _!.;'   |     _|..88\r\n"
				+ "88   |``\"..__ |    |`\";.| i|_|MMMMMMMMMMM|_|'| _!-|   |   _|..-|'    88\r\n"
				+ "88   |      |``--..|_ | `;!|l|MMoMMMMoMMM|1|.'j   |_..!-'|     |     88\r\n"
				+ "88   |      |    |   |`-,!_|_|MMM     MMM|_||.!-;'  |    |     |     88\r\n"
				+ "88___|______|____!.,.!,.!,!|d|MMM FIND MM|p|,!,.!.,.!..__|_____|_____88\r\n"
				+ "88      |     |    |  |  | |_|MMM     MMM|_|| |   |   |    |      |  88\r\n"
				+ "88      |     |    |..!-;'i|r|MPY THE MoM|r| |`-..|   |    |      |  88\r\n"
				+ "88      |    _!.-j'  | _!,\"|_|MMM     MMM|_||!._|  `i-!.._ |      |  88\r\n"
				+ "88     _!.-'|    | _.\"|  !;|1|MMM EXIT MM|l|`.| `-._|    |``-.._  |  88\r\n"
				+ "88..-i'     |  _.''|  !-| !|_|MMM     MMM|_|.|`-. | ``._ |     |``\"..88\r\n"
				+ "88   |      |.|    |.|  !| |u|MoM     MMM|n||`. |`!   | `\".    |     88\r\n"
				+ "88   |  _.-'  |  .'  |.' |/|_|MMMMoMMMMoM|_|! |`!  `,.|    |-._|     88\r\n"
				+ "88  _!\"'|     !.'|  .'| .'|[@]MMMMMMMMMMM[@] \\|  `. | `._  |   `-._  88\r\n"
				+ "88-'    |   .'   |.|  |/| /                 \\|`.  |`!    |.|      |`-88\r\n"
				+ "88      |_.'|   .' | .' |/                   \\  \\ |  `.  | `._-   |  88\r\n"
				+ "88     .'   | .'   |/|  /                     \\ |`!   |`.|    `.  |  88\r\n"
				+ "88  _.'     !'|   .' | /                       \\|  `  |  `.    |`.|  88\r\n"
				+ "88888888888888888888888888888888888888888888888888888888888888888888888");
	}
	}
