From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 20:08:50 +0100
Subject: [Buildroot] [PATCH] e2fsprogs: add security bug fix
In-Reply-To: <f8d75a3978baed74ba272faafc60b23db8fabbcb.1424717647.git.baruch@tkos.co.il>
References: <f8d75a3978baed74ba272faafc60b23db8fabbcb.1424717647.git.baruch@tkos.co.il>
Message-ID: <20150223200850.31d01b86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 23 Feb 2015 20:54:07 +0200, Baruch Siach wrote:
> Add upstream patch fixing CVE-2015-1572: incomplete fix for CVE-2015-0247.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...-fix-potential-buffer-overflow-in-closefs.patch | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
