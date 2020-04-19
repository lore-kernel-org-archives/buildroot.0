From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 23:17:51 +0200
Subject: [Buildroot] [PATCH] package/procps-ng: add
 PROCPS_NG_INSTALL_INIT_OPENRC
In-Reply-To: <20200305105521.26501-1-unixmania@gmail.com>
References: <20200305105521.26501-1-unixmania@gmail.com>
Message-ID: <20200419231751.52a73cfb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Mar 2020 07:55:21 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Avoid installing S02sysctl, since openrc provides /etc/init.d/sysctl.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/procps-ng/procps-ng.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
