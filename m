From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 07:37:31 +0100
Subject: [Buildroot] Some AT91SAM9261-EK Notes
In-Reply-To: <BAY124-DS71A6FE16D4AA2E6DE33BAD2CF0@phx.gbl>
	(quickx@hotmail.com's message of "Fri\,
	23 Jan 2009 15\:06\:42 -0800")
References: <BAY124-W491126D3265E8BD9DCF5DCD2CE0@phx.gbl>
	<1232722423.5311.70.camel@elrond.atmel.com>
	<BAY124-DS41A02756B01D8CBA35C29D2CF0@phx.gbl>
	<87ab9hkb7f.fsf@macbook.be.48ers.dk>
	<BAY124-DS71A6FE16D4AA2E6DE33BAD2CF0@phx.gbl>
Message-ID: <87k58li504.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "QuickX" == QuickX  <quickx@hotmail.com> writes:

 QuickX> I was able to narrow down the problem a bit more.  It seems that the
 QuickX> "UCLIBC_SUPPORT_AI_ADDRCONFIG" is what causes the Segfaults/Core
 QuickX> Dumps, however, this option is only available if UCLIBC_USE_NETLINK is
 QuickX> set.

 QuickX> Results: 0.9.30 (with 0.9.30 config, minus
 QuickX> UCLIBC_SUPPORT_AI_ADDRCONFIG) works fine for dropbear and samba.

Ok, thanks, I'll disable it in the defconfig.

-- 
Bye, Peter Korsgaard
