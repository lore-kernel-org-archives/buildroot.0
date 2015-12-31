From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Dec 2015 15:23:40 +0100
Subject: [Buildroot] [PATCH 1/1] vlc: add optional dependency to
 libmatroska
In-Reply-To: <1451559742-15329-1-git-send-email-pieterjan.camerlynck@gmail.com>
References: <1451559742-15329-1-git-send-email-pieterjan.camerlynck@gmail.com>
Message-ID: <20151231152340.0694f557@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pieterjan Camerlynck,

On Thu, 31 Dec 2015 12:02:22 +0100, Pieterjan Camerlynck wrote:
> libmatroska is an optional dependency to vlc:
> http://git.videolan.org/?p=vlc.git;a=blob;f=configure.ac;h=c46120d7f2a7d49d68d488d617e071148b8c5595;hb=HEAD#l2044
> 
> Add it to vlc.mk to get reproducable builds.
> 
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
> ---
>  package/vlc/vlc.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
