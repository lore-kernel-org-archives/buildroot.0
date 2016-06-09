From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 10:36:48 +0200
Subject: [Buildroot] [PATCH] pcre: add security patches
In-Reply-To: <1465438461-14664-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1465438461-14664-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20160609103648.3bf56721@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Jun 2016 23:14:21 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> They address:
> CVE-2016-1283 - Heap Buffer Overflow Vulnerability.
> CVE-2016-3191 - workspace overflow for (*ACCEPT) with deeply nested
> parentheses.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/pcre/0003-fix-CVE-2016-1283.patch |  44 ++++++++
>  package/pcre/0004-fix-CVE-2016-3191.patch | 174 ++++++++++++++++++++++++++++++
>  2 files changed, 218 insertions(+)
>  create mode 100644 package/pcre/0003-fix-CVE-2016-1283.patch
>  create mode 100644 package/pcre/0004-fix-CVE-2016-3191.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
