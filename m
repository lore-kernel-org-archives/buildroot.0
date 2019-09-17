From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 23:14:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd-bootchart: enable
 systemd-bootchart.service
In-Reply-To: <20190903212812.36514-1-james.hilliard1@gmail.com>
References: <20190903212812.36514-1-james.hilliard1@gmail.com>
Message-ID: <20190917231450.48bee615@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Sep 2019 15:28:12 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This would normally be enabled by systemctl preset-all however since we
> don't have a host systemctl we need to enable the service manually.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/systemd-bootchart/systemd-bootchart.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
