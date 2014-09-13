From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Sep 2014 22:43:56 +0200
Subject: [Buildroot] [PATCH] memstat: Add patch to fix compilation with
 musl libc
In-Reply-To: <1410487449-32325-1-git-send-email-maarten@treewalker.org>
References: <1410487449-32325-1-git-send-email-maarten@treewalker.org>
Message-ID: <20140913224356.174954fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maarten ter Huurne,

On Fri, 12 Sep 2014 04:04:09 +0200, Maarten ter Huurne wrote:

> diff --git a/package/memstat/memstat-0001-PATH_MAX.patch b/package/memstat/memstat-0001-PATH_MAX.patch
> new file mode 100644
> index 0000000..7143f6d
> --- /dev/null
> +++ b/package/memstat/memstat-0001-PATH_MAX.patch

As usual, missing description + SoB in the patch itself.

Also, when you submit a new version for a patch, please make sure to
use --subject-prefix="PATCHv2" when generating or sending the patches.
This will use [PATCHv2] instead of [PATCH] in the e-mail topic, which
helps us track what version is the latest one.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
