From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 23:37:42 +0100
Subject: [Buildroot] [PATCH 6/6] adwaita-icon-theme: new package
In-Reply-To: <1414833694-4236-7-git-send-email-eric.le.bihan.dev@free.fr>
References: <1414833694-4236-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1414833694-4236-7-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20141101233742.222554a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Sat,  1 Nov 2014 10:21:34 +0100, Eric Le Bihan wrote:
> This package provides the Adwaita icon theme from the GNOME desktop
> environment.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in                                |  1 +
>  package/adwaita-icon-theme/Config.in             |  4 ++++
>  package/adwaita-icon-theme/adwaita-icon-theme.mk | 14 ++++++++++++++
>  3 files changed, 19 insertions(+)
>  create mode 100644 package/adwaita-icon-theme/Config.in
>  create mode 100644 package/adwaita-icon-theme/adwaita-icon-theme.mk

This package needs gtk-update-icon-cache, so presumably, it should
depend on host-libgtk3, and therefore also only be selectable for
Gtk3-enabled configuratons, no?

See:
http://autobuild.buildroot.org/results/f8d/f8d0e2198fa54f9141512e2db6dc46e3cee1cd44/build-end.log

Can you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
