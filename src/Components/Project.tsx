export default function Project({title, description, link}: {title: string, description: string, link: string}) {
    return (
        <>
            <div className="w-full h-px bg-[#34373A] mt-1" ></div>
            <div className="w-full h-px bg-[#34373A] mt-1" ></div>
            <div className="w-full h-4/5 py-5">
                <h2 className="text-xl text-left">{title}</h2>
                <h3 className="text-left pt-3">{description}</h3>
                <a href={link} target="_blank" rel="noreferrer" className="text-xl">
                    {title}
                </a>
            </div>
        </>
    )
}