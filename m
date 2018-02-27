From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 22:23:40 +0100
Subject: [Buildroot] [PATCH 1/3] bind BIND_PKGDIR
In-Reply-To: <20180227123924.20725-1-chrismcc@gmail.com>
References: <20180227123924.20725-1-chrismcc@gmail.com>
Message-ID: <20180227222340.3406f799@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Feb 2018 04:39:22 -0800, Christopher McCrory wrote:
> use BIND_PKGDIR instead of package/bind
> 
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/bind/bind.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I've applied to next, after changing the commit title to follow the
convention:

	<package>: <description>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
