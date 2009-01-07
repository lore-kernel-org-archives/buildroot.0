From: Quick X <quickx@hotmail.com>
Date: Wed, 7 Jan 2009 12:51:03 -0800
Subject: [Buildroot] Buildroot Not Using Saved Config for Linux
In-Reply-To: <1231324228.32308.285.camel@elrond.atmel.com>
References: <BAY124-W25B0802FB150D5566BD194D2E10@phx.gbl>
	<1231266708.32308.211.camel@elrond.atmel.com>
	<BAY124-W513BAFC261A9EA054E0337D2DE0@phx.gbl> 
	<1231324228.32308.285.camel@elrond.atmel.com>
Message-ID: <BAY124-W11322A5449FE803A28089FD2DF0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Comment that out, and it will work.
Yes, I just tried commenting out that line with my Rev24237 Buildroot and my local linux config get applied, thank you.

> The real solution is elsewhere.
> If you update the svn then it might work.
I've had problems updating buildroot to a newer revesion for a little while now, which is why I use R24237 (about a month old).  I just tried the newest version today, and even after switch my project to uClibc .30, it gave me different errors about not finding mkimage, so I was unable to test it very well.
 
Regardless, when I do update the revision, I'll keep what you changed in mind :)  Thank you.
_________________________________________________________________
Keep in touch and up to date with friends and family. Make the connection now.
http://www.microsoft.com/windows/windowslive/
