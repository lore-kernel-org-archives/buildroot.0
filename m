From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Dec 2015 16:38:34 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/boost: bump to version 1.59.0
In-Reply-To: <1449052364-1829-1-git-send-email-agalakhov@gmail.com>
References: <1449052364-1829-1-git-send-email-agalakhov@gmail.com>
Message-ID: <20151214163834.0da8755d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey,

On Wed,  2 Dec 2015 11:32:44 +0100, Alexey Galakhov wrote:
> Remove boost patches that are already upstream.
> 
> Add a backport of fix of #11549 (Boost.Log contains has a regression
> that prevents some of the logging statements from compiling).
> 
> Signed-off-by: Alexey Galakhov <agalakhov@gmail.com>

Thanks Alexey. A similar patch was contributed and merged, see
https://git.busybox.net/buildroot/commit/package/boost?id=12ec0cd9af0a9754d97fafddef3c281e95ebe59a.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
