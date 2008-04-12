From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Sat, 12 Apr 2008 09:42:01 +0200
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/u-boot
In-Reply-To: <87lk3k3wnp.fsf@macbook.be.48ers.dk>
References: <20080410210327.E728B3C5B8@busybox.net>	<47FFD045.8080102@eclis.ch>
	<87lk3k3wnp.fsf@macbook.be.48ers.dk>
Message-ID: <480067C9.5090406@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard a ?crit :
>>>>>> "Jean-Christian" == Jean-Christian de Rivaz <jc@eclis.ch> writes:
> 
>  Jean-Christian> Thanks Ulf for this fix. I have found two others
>  Jean-Christian> files with the exact same issue:
>  Jean-Christian> target/device/Atmel/at91bootstrap/at91bootstrap.mk
>  Jean-Christian> target/linux/Makefile.in.advanced
> 
>  Jean-Christian> Please apply the attached patch to fix them.
> 
> Thanks - fixed in r21712.
> 

Thanks. This commit with the initial commit from Ulf,  close the bugs 
2384 and 2394:
http://bugs.uclibc.org/view.php?id=2384
http://bugs.uclibc.org/view.php?id=2394

I have not found a way to close them myself. Is there one ?
-- 
Jean-Christian de Rivaz
