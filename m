From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Feb 2021 21:03:33 +0100
Subject: [Buildroot] [PATCH 1/4] package/collectd: add 'infiniband'
 option
In-Reply-To: <20210216135432.4830-1-patrickdepinguin@gmail.com>
References: <20210216135432.4830-1-patrickdepinguin@gmail.com>
Message-ID: <20210216210333.21ba2711@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Feb 2021 14:54:28 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The infiniband plugin is new since 5.12.0 and enabled by default in
> collectd.
> 
> Add an option in Buildroot, disabled by default.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/collectd/Config.in   | 5 +++++
>  package/collectd/collectd.mk | 1 +
>  2 files changed, 6 insertions(+)

Series applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
