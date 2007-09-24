From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Mon, 24 Sep 2007 08:05:49 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <1190557416.7015.10.camel@elrond.atmel.sweden>
References: <20070923105715.49DFF30087@busybox.net>
	<20070923111910.GE20058@aon.at>
	<1190557416.7015.10.camel@elrond.atmel.sweden>
Message-ID: <1190613949.20002.1.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2007-09-23 at 16:23 +0200, Ulf Samuelsson wrote:
> s?n 2007-09-23 klockan 13:19 +0200 skrev Bernhard Fischer:
> > On Sun, Sep 23, 2007 at 03:57:15AM -0700, ulf at uclibc.org wrote:

<cut _defconfig commit>

> > 3) what error were you seeing?
> Don't remember exactly,
> Reported this two weeks ago. 
> This was fixed by Hans Christian in his trunk.
> 
> It looks like conf does not complete.
> The fix handles that, and the error message is gone.

Running oldconfig after copying in a _defconfig resulted in this error
message:

Generic firewall (BR2_TARGET_GENERIC_FIREWALL) [N/y/?] n
Generic development system (BR2_TARGET_GENERIC_DEV_SYSTEM) [N/y/?] n
#
# configuration written to .config
#

*** Error during writing of the Buildroot configuration.

<cut>

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
