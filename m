From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 18:16:12 +0200
Subject: [Buildroot] [PATCH 3 5/9] lshw: fix build with no LOCALE support
In-Reply-To: <20121101143600.8550.67194.stgit@localhost>
References: <20121101143539.8550.70150.stgit@localhost>
 <20121101143600.8550.67194.stgit@localhost>
Message-ID: <20130731181612.7caacfd4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle \(Essensium/Mind\),

On Thu, 01 Nov 2012 15:36:00 +0100, Arnout Vandecappelle
\(Essensium/Mind\) wrote:
> From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> lshw doesn't need libintl if -DNONLS is defined.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/lshw/Config.in |    2 +-
>  package/lshw/lshw.mk   |   12 +++++++++---
>  2 files changed, 10 insertions(+), 4 deletions(-)

I've applied the following patches of this series:

09704e7ee8a6e49d68359df7b4ebffb4d7819965 libsoup: Remove redundant dependency on gettext
de1932aaff2d0662b268a4ad71905f987155f0bf gdk-pixbuf: remove dependency on gettext
3cb28e173ca15a7ae9e7b741464f6e3e6936165f pulseaudio: remove dependency on gettext
0c2de8da28b859d0ace26743095fb73ae1a94940 avahi: remove double dependency on gettext
cdc2420b4c332a0d69b8198c756bb054386c912a lshw: fix build with no LOCALE support
da8860e4da533bbe3d684354b37174adb0e23b98 util-linux: only needs gettext if locale is selected

I think those ones were the remaining non-applied patches for this series.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
