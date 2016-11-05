From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 23:31:30 +0100
Subject: [Buildroot] [PATCH] libxml2: add upstream security fixes
In-Reply-To: <f02be1a7ba6d3413356cb0710e4e654d6c1aff19.1478373846.git.baruch@tkos.co.il>
References: <f02be1a7ba6d3413356cb0710e4e654d6c1aff19.1478373846.git.baruch@tkos.co.il>
Message-ID: <20161105233130.4789dd15@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 Nov 2016 21:24:06 +0200, Baruch Siach wrote:
> Fixes: CVE-2016-5131, CVE-2016-4658.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...ix-XPointer-paths-beginning-with-range-to.patch | 178 +++++++++++++++
>  ...sallow-namespace-nodes-in-XPointer-ranges.patch | 253 +++++++++++++++++++++
>  2 files changed, 431 insertions(+)
>  create mode 100644 package/libxml2/0001-Fix-XPointer-paths-beginning-with-range-to.patch
>  create mode 100644 package/libxml2/0002-Disallow-namespace-nodes-in-XPointer-ranges.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
