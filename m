From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 14:02:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/trinity: fix build with kernel
 >= 5.13
In-Reply-To: <20210717084825.669692-1-fontaine.fabrice@gmail.com>
References: <20210717084825.669692-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718140244.53e4bf76@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 17 Jul 2021 10:48:25 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/c58119baed8d7711da799e34a5ee1117f46b96f4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-ip-raw.c-fix-build-with-kernel-5.13.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/trinity/0002-net-proto-ip-raw.c-fix-build-with-kernel-5.13.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
