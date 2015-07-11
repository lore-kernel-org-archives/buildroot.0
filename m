From: glscantlen <glscantlen@gmail.com>
Date: Sat, 11 Jul 2015 06:19:44 -0700 (PDT)
Subject: [Buildroot] [Bug 8206] mplayer uses host xorg development files
In-Reply-To: <20150707154301.C9535818F0@busybox.osuosl.org>
References: <bug-8206-163@https.bugs.busybox.net/>
 <20150707154301.C9535818F0@busybox.osuosl.org>
Message-ID: <1436620784516-105279.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

to:	bugzilla at busybox.net
date:	Tue, Jul 7, 2015 at 7:11 PM
subject:	Re: [Bug 8206] mplayer uses host xorg development files
mailed-by:	gmail.com


Hello Thomas,

I am not familiar with the specific log you are asking for,
but I searched the entire buildroot dir with:
buildroot-2015.05$ grep -r ">> mplayer" ./
I got no hits. Is there a logging configuration I may not have turn on ?
Beware I am fairly new to BuildRoot ~3mo. experience.


  -  What exact errors is "mplayer" giving you?

I'll have to apt-get remove xorg-dev on another system.
to rebuild a bad mplayer that generates the errors.
I'll get them to you asap.




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Bug-8206-New-mplayer-uses-host-xorg-development-files-tp104861p105279.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
