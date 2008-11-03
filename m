From: steve at c2root.be <steve@c2root.be>
Date: Mon,  3 Nov 2008 16:05:20 +0100
Subject: [Buildroot] kernel size
In-Reply-To: <87ej1tp5fw.fsf@macbook.be.48ers.dk>
References: <000001c93d37$d5a696d0$80f3c470$@be>
	<87ej1tp5fw.fsf@macbook.be.48ers.dk>
Message-ID: <20081103160520.a46fsp630g44wo00@webmail.digibel.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have fixed. It had to do with the initramfs being enabled. So this  
was built inside the kernel. Once I removed that option, my kernel was  
again 1.5 MB

regards
Steve
Quoting Peter Korsgaard <jacmet@uclibc.org>:

>>>>>> "steve" == steve caster <steve@c2root.be> writes:
>
>  steve> Hi all,
>
>  steve> I am trying to build a kernel with buildroot and are using a
>  steve> separate .config file which I made myself. The kernel is
>  steve> working, yet is about 90MB is size.  This is unbelievable as I
>  steve> nearly don?t have any modules. What could make is so big?
>
> Hard to know without any more details. How big is the kernel if you
> compile it by hand with the buildroot cross compiler? What platform,
> what is your buildroot and kernel .config's?
>
> --
> Bye, Peter Korsgaard
>



----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
