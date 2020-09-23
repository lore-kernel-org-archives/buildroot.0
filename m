From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:28:24 +0200
Subject: [Buildroot] [RFC v1 08/13] package/gst1-devtools: new package
 (was gst1-validate)
In-Reply-To: <20200916194933.24921-8-ps.report@gmx.net>
References: <20200916194933.24921-1-ps.report@gmx.net>
 <20200916194933.24921-8-ps.report@gmx.net>
Message-ID: <20200923222824.0adaab24@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 21:49:28 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  Config.in.legacy                              |  7 ++++
>  package/gstreamer1/Config.in                  |  2 +-
>  .../Config.in                                 | 12 +++----
>  .../gst1-devtools/gst1-devtools.hash          |  3 ++
>  .../gstreamer1/gst1-devtools/gst1-devtools.mk | 32 +++++++++++++++++++
>  .../gst1-validate/gst1-validate.hash          |  3 --
>  .../gstreamer1/gst1-validate/gst1-validate.mk | 29 -----------------
>  7 files changed, 48 insertions(+), 40 deletions(-)
>  rename package/gstreamer1/{gst1-validate => gst1-devtools}/Config.in (59%)
>  create mode 100644 package/gstreamer1/gst1-devtools/gst1-devtools.hash
>  create mode 100644 package/gstreamer1/gst1-devtools/gst1-devtools.mk
>  delete mode 100644 package/gstreamer1/gst1-validate/gst1-validate.hash
>  delete mode 100644 package/gstreamer1/gst1-validate/gst1-validate.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
