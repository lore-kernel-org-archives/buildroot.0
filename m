From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 10:14:38 +0100
Subject: [Buildroot] [PATCH] i2c-tools: fix static build
In-Reply-To: <2c1e421f520c2910f43cc85913628dec1104ea89.1514871379.git.baruch@tkos.co.il>
References: <2c1e421f520c2910f43cc85913628dec1104ea89.1514871379.git.baruch@tkos.co.il>
Message-ID: <20180102101438.1136a648@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Jan 2018 07:36:19 +0200, Baruch Siach wrote:
> Add a patch to disable installation of dynamic library on static build.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2ba/2bab61f82fdab8fe7e13da61b7814a4c33501cd8/
> http://autobuild.buildroot.net/results/284/28474ec930dc82fa504c57927e1f9bd994b2774a/
> http://autobuild.buildroot.net/results/a1b/a1bf99467ad3661dcb3ede491a70a57f1f1e01b1/
> 
> Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...mk-don-t-install-dynamic-library-when-dis.patch | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/i2c-tools/0008-lib-Module.mk-don-t-install-dynamic-library-when-dis.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
