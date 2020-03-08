From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 15:17:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: add dns-over-tls
 support
In-Reply-To: <20200308084131.111253-1-james.hilliard1@gmail.com>
References: <20200308084131.111253-1-james.hilliard1@gmail.com>
Message-ID: <20200308151715.380b21b9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Mar 2020 01:41:31 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Set default-dns-over-tls to opportunistic when dns-over-tls is enabled
> as it should be fully backwards compatible. The DNSOverTLS config in
> resolved.conf can be used to override default-dns-over-tls.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/systemd/systemd.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
