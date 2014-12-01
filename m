From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Dec 2014 10:03:23 +0100
Subject: [Buildroot] [PATCH v5 4/4] guile: Add new package
In-Reply-To: <547B9A19.6060705@paguilar.org>
References: <1416869790-12988-1-git-send-email-paguilar@paguilar.org>
 <1416869790-12988-5-git-send-email-paguilar@paguilar.org>
 <20141126215542.433523bf@free-electrons.com>
 <547B9A19.6060705@paguilar.org>
Message-ID: <20141201100323.6213fec9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pedro Aguilar,

On Sun, 30 Nov 2014 23:28:41 +0100, Pedro Aguilar wrote:

> Thanks for helping me to fix and apply the patches!

You're welcome! Contributions are definitely welcome, and for a first
contribution, packaging guile was not the easiest task to tackle!

> I confirm you that guile is building and running fine for me, I used an 
> Atmel SAMA5 processor.

Thanks for testing again!

> Btw, do you use any script/tool for catching some of the missed things 
> such as adding the wchar dependency to libunistring because it uses 
> functions like wctomb()?
> 
> I would like to detect and fix these things before sending a patch so 
> you don't have to check it again.

I simply use the toolchain configurations available at
http://autobuild.buildroot.org/toolchains/configs/, which offer a
variety of configurations. Not all possible situations, but a few of
them, which allow to find certain problematic cases.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
