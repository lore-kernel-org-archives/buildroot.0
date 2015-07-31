From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2015 14:51:35 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/bdwgc: musl build failure
In-Reply-To: <1438345337-2947-1-git-send-email-brendanheading@gmail.com>
References: <1438345337-2947-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150731145135.4d89e479@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Fri, 31 Jul 2015 13:22:17 +0100, Brendan Heading wrote:

> +Upstream had removed the need for sigcontext and removed the offending
> +code, so backport this change here.
> +
> +Upstream-status: backport
> +Signed-off-by: Brendan Heading <brendanheading@gmail.com>

Then this should at least reference the upstream commit, i.e
https://github.com/ivmai/bdwgc/commit/c887470e0e3310c81ecdb7e736bc5d2ead45db2a,
and credit the original author. The way you sent your patch might lead
to believe that you are backporting your own patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
