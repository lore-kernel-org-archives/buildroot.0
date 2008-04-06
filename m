From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Sun, 06 Apr 2008 17:25:15 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <874paf88ma.fsf@macbook.be.48ers.dk>
References: <03b601c897df$7b07f7b4$85f0af0a@corp.atmel.com>
	<874paf88ma.fsf@macbook.be.48ers.dk>
Message-ID: <47F8EB5B.9050905@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard a ?crit :
>>>>>> "Ulf" == Samuelsson, Ulf <ulf.samuelsson@atmel.com> writes:
> 
>  Ulf> I am not happy with menuconfig
>  Ulf> so either this or revert your
>  Ulf> patch.
>  Ulf> Your choice...
> 
> Bah, as I said back then xconfig is not a good default. It has
> additional dependencies we don't provide/check for and as we already
> use menuconfig interface for buildroot that's the only sane default.
> 
> The default values should work out of the box!
> 
> But as it's just a default, you can always change it locally if you
> prefer xconfig.
> 

I strongly recommend menuconfig. A lot of peoples I know work on virtual 
machines that have just the bare minimal packages to do compilation. 
There don't have X11 and will clearly not install a X11 server just for 
a single configuration tool that have on other side a perfectly working 
console interface. Other problem is that those virtual machines are 
mainly used on Windows based system where the most used program to do a 
SSH connection to it is PuTTY that don't support X11.

Regards,
-- 
Jean-Christian de Rivaz
