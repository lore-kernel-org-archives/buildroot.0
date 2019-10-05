From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:35:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: fix nfs-utils_env.sh
 path
In-Reply-To: <20191003140410.45651-1-james.hilliard1@gmail.com>
References: <20191003140410.45651-1-james.hilliard1@gmail.com>
Message-ID: <20191005233515.0848202f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Oct 2019 08:04:10 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Per upstream commit bf12e1fa9f48e8ee91a2869e69484c70595b5160
> https://cdn.kernel.org/pub/linux/utils/nfs-utils/1.3.4/1.3.4-Changelog
> 
> Currently nfs-utils_env.sh is installed in a
> directory that is own by systemd. They requested
> via https://bugzilla.redhat.com/show_bug.cgi?id=1303113
> to move the script into /usr/libexec/nfs-utils
> 
> As such we must update the installation path for nfs-utils_env.sh.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/nfs-utils/nfs-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
