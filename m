From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 17:19:40 +0100
Subject: [Buildroot] [PATCH 2/2] package/python-pyzmq: Enable draft APIs
 when supported by ZeroMQ
In-Reply-To: <20190205102814.11288-2-lionel@svkt.org>
References: <20190205102814.11288-1-lionel@svkt.org>
 <20190205102814.11288-2-lionel@svkt.org>
Message-ID: <20190206171940.17e85864@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Feb 2019 11:28:14 +0100
Lionel Flandrin <lionel@svkt.org> wrote:

> This doesn't introduce a new config flag, instead it just automatically enables
> draft support if it's configured in the zeromq package itself.
> 
> Signed-off-by: Lionel Flandrin <lionel@svkt.org>
> ---
>  package/python-pyzmq/python-pyzmq.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
