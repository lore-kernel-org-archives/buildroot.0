From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:09:04 +0100
Subject: [Buildroot] [PATCH] pulseview: fix a build error
In-Reply-To: <20181203143403.18506-1-brgl@bgdev.pl>
References: <20181203143403.18506-1-brgl@bgdev.pl>
Message-ID: <20181206220904.131b49ff@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Dec 2018 15:34:03 +0100, Bartosz Golaszewski wrote:
> Add a patch that fixes a build error occuring when libsigrokdecode is
> not selected.
> 
> Fixes: http://autobuild.buildroot.net/results/79ed29bdd1eec9bf7cb5003202da5ceaeb8101b6/
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  ...ar-fix-build-without-libsigrokdecode.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/pulseview/0001-mainbar-fix-build-without-libsigrokdecode.patch

Applied to master, thanks. I assume you have submitted this patch
upstream ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
