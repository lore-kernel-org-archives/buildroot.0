From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 18:55:02 +0200
Subject: [Buildroot] [PATCH] mpd: bump to version 0.18.12
In-Reply-To: <1406721516-15733-1-git-send-email-gustavo@zacarias.com.ar>
References: <1406721516-15733-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140730185502.1400d04b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 30 Jul 2014 08:58:36 -0300, Gustavo Zacarias wrote:
> Small bugfixes and improvements, and patches upstreamed.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...fileDecoderPlugin-fix-build-failure-due-t.patch | 26 ----------------------
>  ...ecoderPlugin-fix-build-failure-due-to-mis.patch | 26 ----------------------
>  ...lient-fix-build-failure-due-to-missing-st.patch | 26 ----------------------
>  ...laylistPlugin-fix-build-failure-due-to-mi.patch | 26 ----------------------
>  package/mpd/mpd.mk                                 |  2 +-
>  5 files changed, 1 insertion(+), 105 deletions(-)
>  delete mode 100644 package/mpd/mpd-0001-decoder-AudiofileDecoderPlugin-fix-build-failure-due-t.patch
>  delete mode 100644 package/mpd/mpd-0002-decoder-OpusDecoderPlugin-fix-build-failure-due-to-mis.patch
>  delete mode 100644 package/mpd/mpd-0003-output-HttpdClient-fix-build-failure-due-to-missing-st.patch
>  delete mode 100644 package/mpd/mpd-0004-playlist-PlsPlaylistPlugin-fix-build-failure-due-to-mi.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
