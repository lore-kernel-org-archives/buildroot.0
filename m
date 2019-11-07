From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Nov 2019 21:58:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/ndisc6: Fix musl build
In-Reply-To: <20191107204726.2834-1-bernd.kuhls@t-online.de>
References: <20191107204726.2834-1-bernd.kuhls@t-online.de>
Message-ID: <20191107215827.65ceec0b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  7 Nov 2019 21:47:26 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/eec/eecbb0ee0901735db9d5595d2d6b91bb22cca3ca/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ndisc6/0001-Fix-musl-build.patch | 34 ++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/ndisc6/0001-Fix-musl-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
