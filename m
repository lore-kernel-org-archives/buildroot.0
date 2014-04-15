From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 21:09:39 +0200
Subject: [Buildroot] [PATCH] flac: needs wchar
In-Reply-To: <1397569213-18072-1-git-send-email-gustavo@zacarias.com.ar>
References: <1397569213-18072-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140415210939.7df65de6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 15 Apr 2014 10:40:13 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/873/873a1b3551c5fe04fa477fd682ff91fecdd41606/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/flac/Config.in                         | 4 ++++
>  package/gstreamer/gst-plugins-good/Config.in   | 4 ++++
>  package/gstreamer1/gst1-plugins-good/Config.in | 4 ++++
>  package/minidlna/Config.in                     | 5 +++--
>  package/mpd/Config.in                          | 2 +-
>  5 files changed, 16 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
