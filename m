From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 13:58:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvips: add giflib optional
 dependency
In-Reply-To: <20210331185943.1430261-1-fontaine.fabrice@gmail.com>
References: <20210331185943.1430261-1-fontaine.fabrice@gmail.com>
Message-ID: <20210404135838.0d49b2b1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 31 Mar 2021 20:59:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> giflib is an optional dependency which is enabled by default since
> version 8.3.0 and
> https://github.com/libvips/libvips/commit/d79407f285c768a7338e73ccfc6cf09480b95582
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libvips/libvips.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
