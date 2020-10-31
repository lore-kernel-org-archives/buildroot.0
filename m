From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 22:04:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/sshfs: fix build with gcc 4.8
In-Reply-To: <20201031202154.904162-1-fontaine.fabrice@gmail.com>
References: <20201031202154.904162-1-fontaine.fabrice@gmail.com>
Message-ID: <20201031220416.726ed4e6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 31 Oct 2020 21:21:54 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build of sshfs 3.7.0 and gcc 4.8
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2dbdc579c55543175716d5f739cabe2ad0864ed6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-sshfs.c-fix-build-with-gcc-4.8.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/sshfs/0001-sshfs.c-fix-build-with-gcc-4.8.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
