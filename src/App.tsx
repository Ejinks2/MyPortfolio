import './styles/App.css';
import './styles/carousel.css';
import Project from './Components/Project';
import { useState } from 'react';
import ski from './assets/ski.jpg';
import fish from './assets/fish.jpg';
import plane from './assets/plane.jpg';
import kickball from './assets/kickball.jpeg';
import About from './Components/About';
import { CCarousel, CCarouselItem, CImage } from '@coreui/react';

function App() {
    const [about, setAbout] = useState(0); 

    const photos = [
        { src: ski, alt: "Skiing" },
        { src: fish, alt: "Fishing" },
        { src: plane, alt: "Solo Flight" },
        { src: kickball, alt: "Kickball Champs" },
    ];

    return (
        <>
            <div>
                <div className='w-1/2 h-1/2 mx-auto bg-white rounded-lg flex flex-col items-center justify-center shadow-xl border-5 border-[#34373A]'>
                    <h1 className="text-4xl block">Ethan Jinks</h1>
                    <h2 className='block'>Welcome to my portfolio!</h2>
                </div>
                <br />
                <div className='flex flex-row gap-5 h-4/5'>
                    <CCarousel 
                        controls 
                        indicators 
                        transition="slide" 
                        interval={false}
                        wrap={true}
                        className="w-1/3 border-7 border-[#34373A] rounded-2xl shadow-xl hover:shadow-2xl transition-shadow duration-300 hover:scale-105" 
                        style={{ height: '400px' }}
                    >
                        {photos.map((photoData, index) => (
                            <CCarouselItem key={index} style={{ transition: 'transform 0.6s ease-in-out' }}>
                                <CImage 
                                    className='d-block w-100 object-cover'
                                    src={photoData.src} 
                                    alt={photoData.alt} 
                                    style={{ height: '400px', width: '100%' }}
                                />
                            </CCarouselItem>
                        ))}
                    </CCarousel>
                    <div className="w-2/3 h-3/4 bg-white rounded-lg shadow-xl ml-auto my-auto p-5 border-4 border-[#34373A]">
                        <About about={about} />
                        <button className='text-white p-2 rounded-md bg-[#1a1a1a]' onClick={() => setAbout(about === 0 ? 1 : 0)}>
                            {about === 0 ? "Why Computer Science?" : "About Me"}
                        </button>
                    </div>
                </div>
                <div className="w-full h-4/5 bg-white rounded-lg shadow-xl mt-5 p-5 border-2 border-[#34373A]">
                    <h2 className="text-4xl text-left">Projects</h2>
                    
                    <ul>
                        <li>
                            <Project
                                title="MySnapVault"
                                description="MySnapVault is a web-based application built for users to
                                    upload photos, videos and audio recordings in order to clear storage
                                    on their own devices. The app uses React, Node.js, and Supabase-javascript
                                    to store and visualize the user's photos and videos, as well as maintain
                                    a user base. The page is hosted from a Raspberry Pi 4 using service files
                                    and is made accessible with port forwarding into an AWS EC2 instance."
                                link="https://www.mysnapvault.com"
                            />
                        </li>
                        <li>
                            <Project 
                                title="NY Crime Data" 
                                description="Myself and 3 other team members spent the semester learning 
                                    about Javascript, HTML, and CSS in order to build this project. 
                                    We also learned some key web development skills such as how to use APIs, 
                                    how to use the DOM, and how routing works. We also learned some security and 
                                    privacy practices when building a website. This particular website was 
                                    built to display data about crime in New York City. We used the NYC 
                                    Open Data API to get the data and display it in a way that was easy to 
                                    understand and use. We also used the Axios library to make the API calls.
                                    We stored cookies in order to keep track of the user's preferences and to 
                                    prevent them from having to login every time they visit the website." 
                                link="https://github.com/Ejinks2/CS546_Group36" 
                            />
                        </li>
                        <li>
                            <Project
                                title="Simulated Recycling Bin"
                                description="Using the Bash interpreter language, I created a 
                                    script that when the user calls the script, creates a .recycle 
                                    folder in the home directory (if it does not exist) and when the 
                                    user gives certain flags, either moves files into the recycling 
                                    folder or deletes all files inside the recycling folder, simulating 
                                    a recycling bin."
                                link="https://github.com/Ejinks2/recycling"
                            />
                        </li>
                        <li>
                            <Project
                                title="Shell Script"
                                description="Using the C language, I was able to build a shell script 
                                    that read user input from the terminal and then executed different 
                                    commands depending on user input. I gained skills concerning 
                                    processes and forking, tokens, buffers, and common C macros."
                                link="https://github.com/Ejinks2/ShellScript"
                            />
                        </li>
                    </ul>
                </div>
                <div className="bg-white rounded-lg shadow-xl mt-15 p-5 w-2/3 m-auto animate-slide-in-from-left border-10 border-[#34373A]">
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
