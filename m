From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:46:04 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/weston: bump to version 6.0.0
In-Reply-To: <20190421152231.107591-1-james.hilliard1@gmail.com>
References: <20190421152231.107591-1-james.hilliard1@gmail.com>
Message-ID: <20190422224604.11a375fd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 21 Apr 2019 09:22:31 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> The autotools build system is in the process of being deprecated and
> replaced with meson for weston. Because of this we need to pass the
> --enable-autotools flag when running configure to enable autotools
> builds.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - Use autotools instead of meson
> ---
>  package/weston/weston.hash | 10 +++++-----
>  package/weston/weston.mk   |  5 +++--
>  2 files changed, 8 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
