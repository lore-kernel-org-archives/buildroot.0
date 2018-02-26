From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Feb 2018 15:47:24 +0100
Subject: [Buildroot] Analysis of build results for 2018-02-25
In-Reply-To: <87bmgbsv4z.fsf@dell.be.48ers.dk>
References: <20180226070010.28C8620727@mail.bootlin.com>
 <20180226113319.7e3bcf6b@windsurf.lan>
 <87fu5nsyrg.fsf@dell.be.48ers.dk>
 <20180226140029.45325514@windsurf.lan>
 <87bmgbsv4z.fsf@dell.be.48ers.dk>
Message-ID: <20180226154724.4e87f072@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Feb 2018 15:06:20 +0100, Peter Korsgaard wrote:

>  > mplayer upstream is dead ? If that is the case, then indeed we should
>  > just take those patches as-is.  
> 
> I haven't followed development in details, but the latest mplayer
> release is more than 2 years old and several forks exists (E.G. mpv).

But isn't mplayer one of those projects that says that releases are
useless, and people should always use the latest trunk/master/tip
because it's obviously "the best".

>  >> > tools/qtextboundaryfinder.cpp:444:1: internal compiler error: in
>  >> > validate_condition_mode, at config/rs6000/rs6000.c:18074    
>  >>   
>  >> > Someone to test this with newer gcc versions ?    
>  >> 
>  >> Or deprecate qt4?  
> 
>  > Just because it's broken on powerpc?  
> 
> Well, mainly because it is no longer maintained upstream. Even Debian is
> removing Qt4:
> 
> https://wiki.debian.org/Qt4Removal

True, but we are not going to remove it for 2018.02, right ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
