From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 22:41:42 +0100
Subject: [Buildroot] [PATCH 1/2] GNURadio: gr-audio: select alsa-lib if
 no backend selected
In-Reply-To: <20170213161319.25131-1-gwenj@trabucayre.com>
References: <20170213161319.25131-1-gwenj@trabucayre.com>
Message-ID: <20170213224142.0de14adf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Feb 2017 17:13:18 +0100, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> gr-audio may be built with alsa-lib or portaudio support. To simplify
> dependencies if no backend is selected, then alsa-lib is the default choice.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/gnuradio/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both patches applied to the next branch, after some small tweaks to the
commit logs.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
