From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 15:55:19 +0200
Subject: [Buildroot] [PATCH v1 1/7] gstreamer1: bump version to 1.6.0
In-Reply-To: <1444253405-3994-1-git-send-email-ps.report@gmx.net>
References: <1444253405-3994-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151011155519.47148424@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Wed,  7 Oct 2015 23:29:59 +0200, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
>  package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks for this series of patches. However, I'm a bit surprised that
only the version and hash are bumped. GStreamer 1.6 apparently has lots
of new features, so I would have expected new Config.in options for
new plugins, and things like that.

Did you check for such things?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
