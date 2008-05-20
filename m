From: Jason Valenzuela <jvalenzuela@dspfl.com>
Date: Tue, 20 May 2008 14:51:36 -0400
Subject: [Buildroot] Bootloaders
In-Reply-To: <326f33790805201145r785b06hcbec87b888ff8a76@mail.gmail.com>
References: <4831FE20.6050508@dspfl.com>	
	<326f33790805191734n68a95ee2m758c4266aeb4d02e@mail.gmail.com>	
	<48330E51.6050505@dspfl.com>	
	<326f33790805201131w57057429ydef6aa0df0bf0ec0@mail.gmail.com>	
	<48331ABD.1060907@dspfl.com>
	<326f33790805201145r785b06hcbec87b888ff8a76@mail.gmail.com>
Message-ID: <48331DB8.30709@dspfl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arun Reddy wrote:
> Well I checked my x86 project and I have grub 0.97-35. I haven't touched 
> that project since April, so they must have removed 35 from this 
> repository pretty recently. I find that really annoying that they only 
> keep the latest version up there.
> 
> Anyway, I am very surprised your build isn't working with version 38. I 
> remember having the same problem with grub because version 0.97-33 
> wasn't available! So I changed the .mk file to direct it to 35 and it 
> worked. I see that version 27 is up there still... can you try getting 
> that one and see what happens?

I found the -35 patch with google and am currently recompiling uClibc as 
you directed. If that builds and grub too, I can see if the -27 builds.


I noticed that there were other grub patches within the target/x86/grub 
directory. Perhaps those don't work correctly with the -38 patch.



Thanks,
Jason Valenzuela
