From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 22:09:21 +0200
Subject: [Buildroot] [PATCH] expat: security bump to version 2.2.1
In-Reply-To: <20170618212004.32001-1-peter@korsgaard.com>
References: <20170618212004.32001-1-peter@korsgaard.com>
Message-ID: <20170619220921.49a88bd9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Jun 2017 23:20:04 +0200, Peter Korsgaard wrote:
> Fixes:
> 
> - CVE-2017-9233 - External entity infinite loop DoS. See:
>   https://libexpat.github.io/doc/cve-2017-9233/
> 
> - CVE-2016-9063 -- Detect integer overflow
> 
> And further more:
> 
> - Fix regression from fix to CVE-2016-0718 cutting off longer tag names.
> 
> - Extend fix for CVE-2016-5300 (use getrandom() if available).
> 
> - Extend fix for CVE-2012-0876 (Change hash algorithm to William Ahern's
>   version of SipHash).
> 
> Also add an upstream patch to fix detection of getrandom().
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...c-Fix-mis-detection-of-getrandom-on-Debia.patch | 29 ++++++++++++++++++++++
>  package/expat/expat.hash                           |  8 +++---
>  package/expat/expat.mk                             |  4 ++-
>  3 files changed, 36 insertions(+), 5 deletions(-)
>  create mode 100644 package/expat/0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
