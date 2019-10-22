From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 22:17:00 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/ofono: remove forced
 autoreconf
In-Reply-To: <20191022134341.34426-1-nicolas.serafini@sensefly.com>
References: <20191022134341.34426-1-nicolas.serafini@sensefly.com>
Message-ID: <20191022221700.4bfe9099@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Oct 2019 13:44:07 +0000
Nicolas Serafini <nicolas.serafini@sensefly.com> wrote:

> The patch that required an autoreconf is no longer there.
> 
> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
> ---
>  package/ofono/ofono.mk | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
