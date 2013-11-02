From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 19:37:44 +0100
Subject: [Buildroot] [PATCH] libvpx: needs thread support
In-Reply-To: <1383408297-17438-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383408297-17438-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131102193744.3f3b4250@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Sat,  2 Nov 2013 17:04:57 +0100, Thomas Petazzoni wrote:
> Fixes:
> 
>   http://autobuild.buildroot.org/results/8de/8def7e54e4fecb7df350443824c00b53d1c61c01/build-end.log
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gstreamer1/gst1-plugins-good/Config.in | 4 ++++
>  package/libvpx/Config.in                       | 4 ++++
>  2 files changed, 8 insertions(+)

Committed to for-peter-2013.11, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
