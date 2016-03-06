From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2016 00:00:06 +0100
Subject: [Buildroot] [PATCH v1 1/1] gmrender-resurrect: new package
In-Reply-To: <201510191206.t9JC6rK5008730@ms-omx02.plus.so-net.ne.jp>
References: <201510191206.t9JC6rK5008730@ms-omx02.plus.so-net.ne.jp>
Message-ID: <20160307000006.7deb5f59@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

On Mon, 19 Oct 2015 21:06:53 +0900, Hiroshi Kawashima wrote:
> gmrender-resurrect is UPnP (DLNA) renderer based on gstreamer.
> 
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> ---
>  package/Config.in                                  |  1 +
>  package/gmrender-resurrect/Config.in               | 15 +++++++++++++++
>  package/gmrender-resurrect/gmrender-resurrect.hash |  2 ++
>  package/gmrender-resurrect/gmrender-resurrect.mk   | 16 ++++++++++++++++
>  4 files changed, 34 insertions(+)
>  create mode 100644 package/gmrender-resurrect/Config.in
>  create mode 100644 package/gmrender-resurrect/gmrender-resurrect.hash
>  create mode 100644 package/gmrender-resurrect/gmrender-resurrect.mk

Applied to master, after doing the following changes, which were both
suggested by Arnout:

    [Thomas:
     - Fix gstreamer related dependency comments to "gstreamer1 ->
       libglib2", as suggested by Arnout.
     - select BR2_PACKAGE_GST1_PLUGINS_BASE as a run-time dependency, as
       suggested by Arnout.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
