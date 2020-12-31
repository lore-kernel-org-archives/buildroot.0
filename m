From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 17:32:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/htop: fix build without wchar
In-Reply-To: <20201216063029.39882-1-fontaine.fabrice@gmail.com>
References: <20201216063029.39882-1-fontaine.fabrice@gmail.com>
Message-ID: <20201231173221.7833f25a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Dec 2020 07:30:29 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/5ad330244546e6f087425be816aea158a1f833cb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ter-restore-non-wide-character-build.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/htop/0001-Meter-restore-non-wide-character-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
