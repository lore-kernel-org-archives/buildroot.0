From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 22:22:49 +0200
Subject: [Buildroot] [PATCH] package/libcamera: bump to version
 448393f77ec9e37cb807e8e8d35c1a4877d253d4
In-Reply-To: <20190919102553.32451-1-kieran.bingham@ideasonboard.com>
References: <20190919102553.32451-1-kieran.bingham@ideasonboard.com>
Message-ID: <20190919222249.7421c42f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Sep 2019 11:25:53 +0100
Kieran Bingham <kieran.bingham@ideasonboard.com> wrote:

> Update to the latest version of libcamera, including a fix for toolchains
> which require libatomic to be linked manually.
> 
> The patch which handles this locally is therefore removed.
> 
> Since the last version update, the option to disable building of the
> unit tests has been renamed from '-Dtests=' to '-Dtest='
> 
> This is updated accordingly.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
