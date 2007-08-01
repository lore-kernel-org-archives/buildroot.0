From: Jinag Robert <cretaceousstone@yahoo.com.cn>
Date: Wed, 1 Aug 2007 10:12:08 +0800 (CST)
Subject: [Buildroot] How to just build one application?
Message-ID: <419079.4317.qm@web15806.mail.cnb.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I added "sambe" with make menuconfig and then issued "make samba". But the build script still build gcc tool chain first.  

----- Original Message ----
From: Philippe Ney <philippe.ney@tizoo.com>
To: buildroot at uclibc.org
Sent: Tuesday, July 31, 2007 5:45:31 PM
Subject: Re: [Buildroot] How to just build one application?

> Hello All,
> 
> I've installed  arm linux gcc 4.1.1 toolchains and I want to build uclibc samba with buildroot package. How can I skip building toolchains and just build samba package with the pre-installed toolchains ?
> 
> Thanks,

Hi,

$ make samba

You can build any target that is defined in a *.mk file by passing it
directly to the make call.

Philippe
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot





      ____________________________________________________________________________________
Shape Yahoo! in your own image.  Join our Network Research Panel today!   http://surveylink.yahoo.com/gmrs/yahoo_panel_invite.asp?a=7 
