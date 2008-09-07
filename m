From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sun, 7 Sep 2008 23:59:31 +0200
Subject: [Buildroot] directive without effect
In-Reply-To: <200809071913.19696.markus.heidelberg@web.de>
References: <200809071913.19696.markus.heidelberg@web.de>
Message-ID: <20080907215931.GB28010@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 07, 2008 at 07:13:19PM +0200, Markus Heidelberg wrote:
>Hello,
>
>revision r19279 from 27.07.2007 uses an invalid variable name
>CONFIG_BR2_PACKAGE_LINUX, so that the if-statement is always false. I don't
>know the state, when the change was commited, so I'm not sure what to do.
>
>a) remove CONFIG_ because BR2_PACKAGE_LINUX does exist

indeed. Thanks for noticing it!
