From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:31:39 +0200
Subject: [Buildroot] [PATCH 1/2] connman: fix missing dbus configuration
 files
In-Reply-To: <1444919707-29869-1-git-send-email-mike@mikebwilliams.com>
References: <1444919707-29869-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <20151017163139.5aeb51cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Thu, 15 Oct 2015 10:35:06 -0400, Mike Williams wrote:
> Without connman.conf in /etc/dbus-1/system.d/, connmand cannot take
> its name on the dbus system bus and will fail to start with a
> permission denied error.
> 
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>
> ---
>  package/connman/connman.mk | 1 +
>  1 file changed, 1 insertion(+)

Both patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
