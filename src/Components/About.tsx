export default function About({about}: {about: number}) {
    return (
        <>
            {about === 0 ? (
                <>
                    <h2 className="text-4xl text-left">About Me</h2>
                    <h3 className='p-5'>
                    Hi! My name is Ethan Jinks. I'm a junior Computer Science major at Stevens
                    Institute of Technology with a passion for learning and problem solving!
                    I have taken a variety of courses that have helped me develop my skills in a 
                    variety of areas. I specialize in React web and app development, as well as
                    systems programming with Linux operating systems. I like to lead, teach, and 
                    inspire others and hope that my software skills can be used to help others!
                    </h3>
                </>
            ) : (
                <>
                    <h2 className="text-4xl text-left">Why Computer Science?</h2>
                    <h3 className='p-5'>
                        I chose to study Computer Science because there is a creative freedom 
                        that comes from being able to code, writing programs where not even physics 
                        are the limit. I also love the idea of being able to create something that 
                        can be used by others and help them in their daily lives. Together, these
                        allow me to use my creative freedom to build products that serve people
                        and help to make a difference in the world, little by little.
                    </h3>
                </>
            )}
        </>
    )
}