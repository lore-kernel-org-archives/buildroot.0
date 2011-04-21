From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Thu, 21 Apr 2011 20:22:23 +0100
Subject: [Buildroot] [PATCH] ncurses: version bump to 5.8
In-Reply-To: <878vv423zn.fsf@macbook.be.48ers.dk>
References: <1300923770-13698-1-git-send-email-vapier@gentoo.org>
	<871v1iz4rw.fsf@macbook.be.48ers.dk> <1301952165.27248.2.camel@segulix>
	<87pqogj49u.fsf@macbook.be.48ers.dk> <1303322103.8512.4.camel@segulix>
	<878vv423zn.fsf@macbook.be.48ers.dk>
Message-ID: <1303413743.6641.12.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-04-20 at 20:05 +0200, Peter Korsgaard wrote: 
> >>>>> "Sergio" == Sergio Monteiro Basto <sergio@sergiomb.no-ip.org> writes:
> 
> Hi,
> 
>  Sergio> After you fix the build error, I wrote that we should built
>  Sergio> ncurses with configure option --with-termlib=tinfo , which
>  Sergio> Fedora use by default .  And you wrote to make a "patch adding
>  Sergio> optional tinfo build" , I done one draft of the patch.
> 
>  Sergio> Since this bug in runtime, seems to be with terminfo, build with option
>  Sergio> --with-termlib=tinfo , doesn't solve the problem ? 
> 
> I haven't tried, but doesn't that just shuffle part of the ncurses
> functions into libtinfo? I don't right away see why that would fix
> anything, but I'll start a build now.

so, it fix anything ? 

> Besides this hypothetical fix, is there any other reason why
> --with-termlib=tinfo would be preferable?

Well, What I know is. 
Is a default of Fedora and seems to me that ncurses becomes better.
In fact builds libtinfo.so which will be use (when exist) in some others
packages, one of them is dialog. 
I can't say nothing more for sure , but packages use libtinfo.so if they
exist by default, so probably will work better if lib exist. 

Best regards,
-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110421/16a29976/attachment.bin>
