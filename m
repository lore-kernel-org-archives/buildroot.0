From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 15:48:55 +0200
Subject: [Buildroot] [PATCH] collectd: fix parallel build issues
In-Reply-To: <1436188343-11234-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436188343-11234-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150706154855.28a56f19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  6 Jul 2015 10:12:23 -0300, Gustavo Zacarias wrote:
> For version 5.5.x a reorganization was made and some common funtionality
> was moved to libraries, however proper dependency accounting isn't
> handled in the Makefile thus causing build breakage on some parallel
> builds. Fixes:
> http://autobuild.buildroot.net/results/a5e/a5e6891e9ea66ac8216d3302da3702770ef7247b/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...-libavltree-libcommon-libheap-dependencies.patch | 21 +++++++++++++++++++++
>  package/collectd/collectd.mk                        |  2 ++
>  2 files changed, 23 insertions(+)
>  create mode 100644 package/collectd/0001-build-add-libavltree-libcommon-libheap-dependencies.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
