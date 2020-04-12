From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:38:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: enable nss-mymachines
 when machined is enabled
In-Reply-To: <20200308222711.75586-1-james.hilliard1@gmail.com>
References: <20200308222711.75586-1-james.hilliard1@gmail.com>
Message-ID: <20200412153801.2d176206@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Mar 2020 16:27:11 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/systemd/systemd.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. For this one and the nss-resolve patch, does
it make sense to tweak nssswitch.conf to enable those NSS modules when
they are available ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
