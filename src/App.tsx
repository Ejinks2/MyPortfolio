import './styles/App.css';

function App() {

  return (
    <>
        <div>
            <div className='w-1/2 h-30 bg-white rounded-lg flex flex-col items-center justify-center shadow-xl'>
                <h1 className="text-4xl block">Ethan Jinks</h1>
                <h2 className='block'>Welcome to my portfolio!</h2>
            </div>
            <br />
            <div className="w-2/3 h-60 bg-white rounded-lg shadow-xl ml-auto p-5">
                <h2 className="text-4xl text-left">About Me</h2>
                <h3 className='p-5'>
                Hi! My name is Ethan Jinks. I'm a junior Computer Science major at Stevens
                Institute of Technology with a passion for learning and problem solving!
                Some of my favorite courses that I've taken include Systems Programming,
                Web Programming I, and Principles of Programming Languages. I like to
                lead, teach, and inspire others and hope that my software skills can be
                used to help others!
                </h3>
            </div>
            <div className="w-full h-4/5 bg-white rounded-lg shadow-xl mt-5 p-5">
                <h2 className="text-4xl text-left">Projects</h2>

                <div className="w-full h-px bg-[#34373A] mt-1" ></div>
                <div className="w-full h-px bg-[#34373A] mt-1" ></div>
                
                <ul>
                    <li>
                        <h3 className="text-xl text-left pt-3">NY Crime Data</h3>
                        <h4 className='mt-2'>
                            Myself and 3 other team members spent the semester learning about Javascript, HTML, and CSS
                            in order to build this project. We also learned some key web development skills such as
                            how to use APIs, how to use the DOM, and how routing works. We also learned some security and 
                            privacy practices when building a website. This particular website was built to display data about crime in New York City.
                            We used the NYC Open Data API to get the data and display it in a way that was easy to understand and use.
                            We also used the Axios library to make the API calls.
                            We stored cookies in order to keep track of the user's preferences and to prevent them from having to login every time they visit the website.
                        </h4>
                        <a href="https://github.com/Ejinks2/CS546_Group36" target="_blank" rel="noreferrer" className="text-xl">NY Crime Data</a>
                    </li>
                    <li>
                        <div className="w-full h-px bg-[#34373A] mt-1" ></div>
                        <div className="w-full h-px bg-[#34373A] mt-1" ></div>
                    </li>
                    <li>
                        <h3 className="text-xl text-left pt-3">Simulated Recycling Bin</h3>
                        <h4 className='mt-2'>
                        Using the Bash interpreter language, I created a script that when the
                        user calls the script, creates a .recycle folder in the home directory
                        (if it does not exist) and when the user gives certain flags, either
                        moves files into the recycling folder or deletes all files inside the
                        recycling folder, simulating a recycling bin.
                        </h4>
                        <a href="https://github.com/Ejinks2/recycling" target="_blank" rel="noreferrer" className="text-xl">
                        Simulated Recycling Bin
                        </a>
                    </li>
                    <li>
                        <div className="w-full h-px bg-[#34373A] mt-1" ></div>
                        <div className="w-full h-px bg-[#34373A] mt-1" ></div>
                    </li>
                    <li>
                        <h3 className="text-xl text-left pt-3">Shell Script</h3>
                        <h4 className='mt-2'>
                        Using the C language, I was able to build a shell script that read
                        user input from the terminal and then executed different commands
                        depending on user input. I gained skills concerning processes and
                        forking, tokens, buffers, and common C macros.
                        </h4>
                        <a href="https://github.com/Ejinks2/ShellScript" target="_blank" rel="noreferrer" className='text-xl'>
                        Shell Script
                        </a>
                    </li>
                </ul>
            </div>
            <div className="">
                <blockquote>
                <h3 id="quote">
                    The world is full of kind people. If you can't find one, be one.
                </h3>
                <h3> - Unknown </h3>
                </blockquote>
            </div>
        </div>
    </>
  );
}

export default App
