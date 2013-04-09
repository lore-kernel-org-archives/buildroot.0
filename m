From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Apr 2013 20:13:50 +0200
Subject: [Buildroot] [PATCH] Linaro toolchain fix
In-Reply-To: <1365507007.19377.YahooMailNeo@web133106.mail.ir2.yahoo.com>
References: <1365507007.19377.YahooMailNeo@web133106.mail.ir2.yahoo.com>
Message-ID: <20130409201350.339b8a9e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Michael Trimarchi,

On Tue, 9 Apr 2013 12:30:07 +0100 (BST), Michael Trimarchi wrote:

> Sorry for not having the patch inline but I think that this is an error on the buildroot Makefile

Indeed, this is a mistake in the current code.

However, I've sent a few days ago a patch that updates the Linaro
toolchains to newer versions, and that happens to fix this problem as a
side-effect. See
http://lists.busybox.net/pipermail/buildroot/2013-April/070204.html.

Thanks for your report!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
