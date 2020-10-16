From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Oct 2020 20:12:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcroco: drop package
In-Reply-To: <20201016055248.1968370-1-fontaine.fabrice@gmail.com>
References: <20201016055248.1968370-1-fontaine.fabrice@gmail.com>
Message-ID: <20201016201255.40edcc7c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 16 Oct 2020 07:52:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop libcrococo as it is affected by several security issues such as
> CVE-2020-12825 which will never be fixed as this project has been
> archived:
> https://gitlab.gnome.org/Archive/libcroco/-/issues/8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Config.in.legacy               |  8 ++++++++
>  package/Config.in              |  1 -
>  package/libcroco/Config.in     | 20 --------------------
>  package/libcroco/libcroco.hash |  5 -----
>  package/libcroco/libcroco.mk   | 21 ---------------------
>  5 files changed, 8 insertions(+), 47 deletions(-)
>  delete mode 100644 package/libcroco/Config.in
>  delete mode 100644 package/libcroco/libcroco.hash
>  delete mode 100644 package/libcroco/libcroco.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
