From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:54:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/rsyslog: add imhttp support
In-Reply-To: <20210315074423.1530562-1-fontaine.fabrice@gmail.com>
References: <20210315074423.1530562-1-fontaine.fabrice@gmail.com>
Message-ID: <20210316215441.47b4171a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Mar 2021 08:44:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> imhttp support is available since version 8.2010.0 and only depends on
> civetweb:
> https://github.com/rsyslog/rsyslog/commit/6102f6083cfa73fe4a91e3d34c4d1dc924465278
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rsyslog/rsyslog.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
