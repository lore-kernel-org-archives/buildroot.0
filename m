From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 21:46:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: enable wireguard
In-Reply-To: <20200308070741.42542-1-james.hilliard1@gmail.com>
References: <20200308070741.42542-1-james.hilliard1@gmail.com>
Message-ID: <20200326214640.437bc16e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Mar 2020 00:07:41 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> We also need to select libmnl when building with wireguard support or
> with nftables.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/connman/Config.in  | 5 +++++
>  package/connman/connman.mk | 9 ++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)

I've applied to master, but only the parts related to wireguard
support, as the rest was applied separately.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
