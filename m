From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 15:46:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: transcoding depends
 on ffmpeg
In-Reply-To: <20171029130838.5077-1-bernd.kuhls@t-online.de>
References: <20171029130838.5077-1-bernd.kuhls@t-online.de>
Message-ID: <20171029154606.34c65573@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 14:08:38 +0100, Bernd Kuhls wrote:
> Commit
> https://git.buildroot.net/buildroot/commit/package/tvheadend?id=a9a14dc4357d32f705a52a5da73c782576ce6bc8
> forgot to add the reverse dependency from ffmpeg.
> 
> Fixes
> http://autobuild.buildroot.net/results/91a/91a08e63690421a0c197e987af15e91e78afb96f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tvheadend/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
