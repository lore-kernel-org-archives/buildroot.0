From: Paul Jones <paul@pauljones.id.au>
Date: Tue, 20 Jul 2010 17:19:22 +1000
Subject: [Buildroot] Issue with Xfbdev and keyboard
In-Reply-To: <20100720085516.0f7b0887@surf>
References: <20100720085516.0f7b0887@surf>
Message-ID: <002101cb27db$e17e6830$a47b3890$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Tuesday, 20 July 2010 4:55 PM
> To: buildroot at uclibc.org
> Subject: [Buildroot] Issue with Xfbdev and keyboard
> 
> Hello,
> 
> I'm trying to use our Xfbdev X.org server, but it unfortunately complains
on
> startup with:
> 
> ==========================================================
> =========
> (EE) XKB: Couldn't open rules file /usr/share/X11/xkb/rules/base
> XKB: Failed to compile keymap
> Keyboard initialization failed. This could be a missing or incorrect setup
of
> xkeyboard-config
> ==========================================================
> =========


From memory I had the same trouble when building for ARM. X86 seemed to work
without it though.


Paul.
