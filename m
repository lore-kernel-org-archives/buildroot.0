From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 23:04:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/qemu: fix build with kernel >=
 5.2
In-Reply-To: <20190812205437.11191-1-fontaine.fabrice@gmail.com>
References: <20190812205437.11191-1-fontaine.fabrice@gmail.com>
Message-ID: <20190812230421.5adeb8c7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 12 Aug 2019 22:54:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/9bc0ed3ce74ec5e09263f625477393d5149eb872
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ly-sized-SIOCGSTAMP-with-new-kernels.patch | 337 ++++++++++++++++++
>  1 file changed, 337 insertions(+)
>  create mode 100644 package/qemu/3.1.0/0003-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
