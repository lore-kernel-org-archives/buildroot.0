From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 14:02:34 +0200
Subject: [Buildroot] [PATCH] libgtk3: bump to version 3.14.11
In-Reply-To: <1427802148-31314-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427802148-31314-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150331140234.3037c11a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 31 Mar 2015 08:42:28 -0300, Gustavo Zacarias wrote:
> Remove upstream patch.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...lug-is-conditionally-supported-on-X11-onl.patch | 57 ----------------------
>  package/libgtk3/libgtk3.hash                       |  4 +-
>  package/libgtk3/libgtk3.mk                         |  2 +-
>  3 files changed, 3 insertions(+), 60 deletions(-)
>  delete mode 100644 package/libgtk3/0006-window-GtkPlug-is-conditionally-supported-on-X11-onl.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
