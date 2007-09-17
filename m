From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 17 Sep 2007 11:27:35 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
In-Reply-To: <1190025802.8052.4.camel@elrond.sweden.atmel.com>
References: <20070917075500.052F2A4692@busybox.net>
	<1190025802.8052.4.camel@elrond.sweden.atmel.com>
Message-ID: <20070917092735.GA18888@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 17, 2007 at 12:43:22PM +0200, Ulf Samuelsson wrote:
>m?n 2007-09-17 klockan 00:55 -0700 skrev aldot at uclibc.org:
>> Author: aldot
>> Date: 2007-09-17 00:54:52 -0700 (Mon, 17 Sep 2007)
>> New Revision: 19862
>> 
>> Log:
>> - Atmel mirrors are only of interrest for atmel
>> 
>> 
>> Modified:
>>    trunk/buildroot/target/device/Mirrors.in
>> 
>> 
>
>And making it depending on BR2_ATMEL or similar makes it impossible to 
>put package support on that ftp site, so don't create any dependency
>at all.

This can depend on BR2_TARGET_ATMEL or some at91 config symbol.
Depending on BR2_arm is wrong since i want to build arm toolchains but
use upstream sources, not some vendor supplied tarballs.

If we need to mirror certain packages, we can of course do this (as the
buildroot project), but using random vendor's locked-down ftp server for
this purpose is not a sensible thing to do, IMO.
