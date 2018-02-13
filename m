From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 22:54:15 +0100
Subject: [Buildroot] [PATCH] systemd: resolved was renamed to resolve in
 meson build
In-Reply-To: <20180212210240.GA19381@waldemar-brodkorb.de>
References: <20180212210240.GA19381@waldemar-brodkorb.de>
Message-ID: <20180213225415.677088f9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Feb 2018 22:02:41 +0100, Waldemar Brodkorb wrote:
> While the conversion to meson, this seems to be missed.
> Found while trying to build systemd with uClibc toolchain.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/systemd/systemd.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
