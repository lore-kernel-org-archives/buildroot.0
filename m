From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:25:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/wayland: switch to https
In-Reply-To: <20200607211955.4004689-1-fontaine.fabrice@gmail.com>
References: <20200607211955.4004689-1-fontaine.fabrice@gmail.com>
Message-ID: <20200610232502.3f70d1d7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Jun 2020 23:19:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> --2020-06-07 20:39:28--  http://wayland.freedesktop.org/releases/wayland-1.18.0.tar.xz
> Resolving wayland.freedesktop.org (wayland.freedesktop.org)... 35.227.58.183
> Connecting to wayland.freedesktop.org (wayland.freedesktop.org)|35.227.58.183|:80... connected.
> HTTP request sent, awaiting response... 308 Permanent Redirect
> 2020-06-07 20:39:29 ERROR 308: Permanent Redirect.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f3af97ad46830568ee3ad710fe45329f7626c27b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wayland/Config.in  | 2 +-
>  package/wayland/wayland.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
