From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 15:24:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/audiofile: Fix static linking
 with libsndfile
In-Reply-To: <20170527160446.31082-1-bernd.kuhls@t-online.de>
References: <20170527160446.31082-1-bernd.kuhls@t-online.de>
Message-ID: <20170528152403.5c0d0e01@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 May 2017 18:04:46 +0200, Bernd Kuhls wrote:
> Fixes mpd:
> http://autobuild.buildroot.net/results/799/7997ccd698f03885f98d00bd150dc3a578e4b161/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0009-Fix-static-linking-with-libsndfile.patch  | 193 +++++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 package/audiofile/0009-Fix-static-linking-with-libsndfile.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
