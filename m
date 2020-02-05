From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 15:42:48 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/elixir: new package
In-Reply-To: <20200204100733.22106-2-frank.vanbever@essensium.com>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
 <20200204100733.22106-1-frank.vanbever@essensium.com>
 <20200204100733.22106-2-frank.vanbever@essensium.com>
Message-ID: <20200205154248.63be3b56@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  4 Feb 2020 11:07:32 +0100
Frank Vanbever <frank.vanbever@essensium.com> wrote:

> elixir is required to build RabbitMQ starting from v3.7
> 
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> ---
> Changes v1 -> v2:
>  - change dependency from target erlang to host-erlang
> ---
>  DEVELOPERS                 |  1 +
>  package/elixir/elixir.hash |  3 +++
>  package/elixir/elixir.mk   | 21 +++++++++++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 package/elixir/elixir.hash
>  create mode 100644 package/elixir/elixir.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
