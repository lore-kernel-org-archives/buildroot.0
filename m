From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Jan 2009 21:40:36 +0100
Subject: [Buildroot] Some AT91SAM9261-EK Notes
In-Reply-To: <BAY124-DS41A02756B01D8CBA35C29D2CF0@phx.gbl>
	(quickx@hotmail.com's message of "Fri\,
	23 Jan 2009 11\:38\:55 -0800")
References: <BAY124-W491126D3265E8BD9DCF5DCD2CE0@phx.gbl>
	<1232722423.5311.70.camel@elrond.atmel.com>
	<BAY124-DS41A02756B01D8CBA35C29D2CF0@phx.gbl>
Message-ID: <87ab9hkb7f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "QuickX" == QuickX  <quickx@hotmail.com> writes:

Hi,

 QuickX> My guess is that it's the "UCLIBC_USE_NETLINK" option since
 QuickX> it looks like only networky applications are affected
 QuickX> (dropbear, samba, etc).  I'm actually catching a plane in 8
 QuickX> hours and will be gone for a week, however, I can try to test
 QuickX> the options one by one if you can't tell what it is from just
 QuickX> the diff.

You're not the only one having problems with uclibc 0.9.30 and
netlink:

http://lists.uclibc.org/pipermail/uclibc/2009-January/041701.html

Maybe we should just disable it in the 0.9.30 defconfig? What is the
impact of doing that?

-- 
Bye, Peter Korsgaard
