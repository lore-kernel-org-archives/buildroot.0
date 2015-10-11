From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 15:05:01 +0200
Subject: [Buildroot] [PATCH v1] nodejs: fix typo for arm predefined
 macro used for atomicops
In-Reply-To: <1444548587-30217-1-git-send-email-ps.report@gmx.net>
References: <1444548587-30217-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151011150501.0fee9223@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sun, 11 Oct 2015 09:29:47 +0200, Peter Seiderer wrote:

> diff --git a/package/nodejs/0.12.7/0005-Fix-typo-for-arm-predefined-macrco-in-atomicops_inte.patch b/package/nodejs/0.12.7/0005-Fix-typo-for-arm-predefined-macrco-in-atomicops_inte.patch

Typo in the file name macrco -> macro.

> +Subject: [PATCH] Fix typo for arm predefined macrco in

And here as well.

Committed with these typos fixed. Please submit the patch upstream.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
