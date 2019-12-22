From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 23:27:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: fix build with uclibc
In-Reply-To: <20191215173431.516170-1-fontaine.fabrice@gmail.com>
References: <20191215173431.516170-1-fontaine.fabrice@gmail.com>
Message-ID: <20191222232750.75161965@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Dec 2019 18:34:31 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - autobuild.buildroot.org/results/9507739b3d5d51024ee9c60b74c2f85d5004e7e2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0010-Include-stdint.h-before-cmoka.h.patch | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 package/samba4/0010-Include-stdint.h-before-cmoka.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
