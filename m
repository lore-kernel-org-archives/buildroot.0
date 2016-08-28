From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Aug 2016 15:50:46 +0200
Subject: [Buildroot] [PATCH] webkitgtk: security bump to version 2.12.4
In-Reply-To: <1472389899-29460-1-git-send-email-gustavo@zacarias.com.ar>
References: <1472389899-29460-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160828155046.1ab89924@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Aug 2016 10:11:39 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-4590 - mishandles about: URLs, which allows remote attackers to
> bypass the Same Origin Policy via a crafted web site.
> 
> CVE-2016-4591 - mishandles the location variable, which allows remote
> attackers to access the local filesystem via unspecified vectors.
> 
> CVE-2016-4622 - allows remote attackers to execute arbitrary code or
> cause a denial of service (memory corruption) via a crafted web site, a
> different vulnerability than CVE-2016-4589, CVE-2016-4623, and
> CVE-2016-4624.
> 
> CVE-2016-4624 - allows remote attackers to execute arbitrary code or
> cause a denial of service (memory corruption) via a crafted web site, a
> different vulnerability than CVE-2016-4589, CVE-2016-4622, and
> CVE-2016-4623.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/webkitgtk/webkitgtk.hash | 6 +++---
>  package/webkitgtk/webkitgtk.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
