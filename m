From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:31:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: add systemd dependency
In-Reply-To: <20191103060743.107052-1-james.hilliard1@gmail.com>
References: <20191103060743.107052-1-james.hilliard1@gmail.com>
Message-ID: <20191104223111.52955546@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 Nov 2019 00:07:43 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This is needed to ensure systemd services are installed.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/iputils/iputils.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
