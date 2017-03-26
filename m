From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 22:51:35 +0200
Subject: [Buildroot] [PATCH 1/6] dbus-glib: fix legal info
In-Reply-To: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20170326225135.5fe7a6dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 23:18:50 +0530, Rahul Bedarkar wrote:
> dbus glib bindings are dual licensed under AFLv2.1 or GPLv2+.
> Separate licenses using 'or' keyword.
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/dbus-glib/dbus-glib.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patches 1 to 3 applied. On PATCH 3, I've changed MPLv1.1 to MPL-1.1, to
match the SPDX license code.

As discussed previously, I've dropped patches 4 to 6, since we really
want to use the SPDX license codes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
