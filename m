From: Assen Stoyanov <softa@ttechgroup.com>
Date: Tue, 15 May 2007 11:46:57 +0300
Subject: [Buildroot] Matchbox Support
References: <008001c79625$3558b1f0$2600a8c0@engineering5>
Message-ID: <005301c796cd$98e56120$6614a8c0@lap>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I am 99% ready with the port of matchbox project. Incl.:
- Matchbox Window Manager
- Matchbox Startup Notification
- Matchbox Desktop
- Matchbox Virtual Keyboard

Also other thinks that are 100% done are:

1) lilo 22.8 (x86 boot loader)
2) tslib 1.0 (touchscreen lib and utils)
3) X11R7 libs (libX11.so)
3.1) libICE.so - Inter Client Exchange library
3.2) libXdmcp.so - X Display Manager Control Protocol library
3.3) libXfixes.so - X Fixes extension library
3.4) libXfont.so - X font libary (used by the X server)
3.5) libXext.so - X Extension library
3.6) libXtst.so - X Test Extensions library
3.7) libXdamage.so - X Damage library
3.8) libXcomposite.so - X Composite library
3.9) libXres.so - X Resources library
3.10) libXrender.so - X Render extension library
3.11) libXrandr.so - X Resize and Rotate extension library
3.12) libXcursor.so - Client-side cursor loading library
3.13) libXft.so - X FreeType library. Client-side fonts with FreeType
3.14) libSM.so - X Session Management library.
3.15) libxkbfile.so - X KBFile utils library.
3.16) libXt.so - X Toolkit library.
3.17) libXmu.so - X Xmu/Xmuu library.
3.18) libXpm.so - X Pixmap library.
3.19) libXaw.so - X Athena Extensions.
4) X11R7 Kdrive (TinyX) Servers (incl. tslib support)

TODOs (this week):
- refactor cairo;
- refactor glib/gtk;
- add jikes java compiler in toolchain;
- add JamVM (java virtual machine)
- add GNU Classpath 0.95 with (optional) GTK/Cairo peers for full awt/swing 
support.

My question is - what is the best way to submit all these changes to the 
buildroot repository?

Best Regards,
Assen Stoyanov

----- Original Message ----- 
From: "Christopher Reder" <creder@digitalcpt.com>
To: <buildroot@uclibc.org>
Sent: Monday, May 14, 2007 15:41
Subject: [Buildroot] Matchbox Support


> Hello all.  I am using buildroot for a project with an ARM at91rm9200 and 
> it
> is working nicely after getting some assistance building.  It is building 
> a
> file system with busybox and tiny-x and I'd like to incorporate a desktop
> like matchbox in with it.  I read that there were a few people 
> incorporating
> it into the build but I could not find it in there.  Can someone let me 
> know
> if it is in there or if they have a patch to add it in?
>
>
>
> Thanks in advance!
> Christopher Reder
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>
> -- 
> No virus found in this incoming message.
> Checked by AVG Free Edition.
> Version: 7.5.467 / Virus Database: 269.7.0/804 - Release Date: 5/14/2007 
> 4:46 PM
>
> 



-- 
No virus found in this outgoing message.
Checked by AVG Free Edition. 
Version: 7.5.467 / Virus Database: 269.7.0/804 - Release Date: 5/14/2007 4:46 PM
