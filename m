From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 12:18:43 +0200
Subject: [Buildroot] [PATCH v3,
 4/6] package/collectd: add InfluxDB support
In-Reply-To: <20200415063008.2237470-4-fontaine.fabrice@gmail.com>
References: <20200415063008.2237470-1-fontaine.fabrice@gmail.com>
 <20200415063008.2237470-4-fontaine.fabrice@gmail.com>
Message-ID: <20200817121843.6f97a58c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Apr 2020 08:30:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> InfluxDB support is available since version 5.11.0 and
> https://github.com/collectd/collectd/commit/605fcdcddeefb23b945203079e5c87625ce0e336
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/collectd/Config.in   | 6 ++++++
>  package/collectd/collectd.mk | 1 +
>  2 files changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
