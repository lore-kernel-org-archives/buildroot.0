From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 16:29:22 +0200
Subject: [Buildroot] [PATCH] package/busybox: add
 BUSYBOX_INSTALL_INIT_OPENRC
In-Reply-To: <20200418213923.1548313-1-unixmania@gmail.com>
References: <20200418213923.1548313-1-unixmania@gmail.com>
Message-ID: <20200419162922.37a644c3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 Apr 2020 18:39:23 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Install the sysvinit scripts, for the moment, but not S02sysctl, since
> openrc provides /etc/init.d/sysctl.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/busybox/busybox.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
