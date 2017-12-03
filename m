From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:06:59 +0100
Subject: [Buildroot] [PATCH] package/avahi: fix build failures
In-Reply-To: <20171203111344.8661-1-s.martin49@gmail.com>
References: <20171203111344.8661-1-s.martin49@gmail.com>
Message-ID: <20171203230659.19b71d46@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Dec 2017 12:13:44 +0100, Samuel Martin wrote:
> Since [1], avahi uses/checks for pygobject instead of pygtk, so update
> the configure options accordingly.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/ffea97dc13d379d32f9e33ae6f9e986b2c435ea9
>   and many others
> 
> [1] https://github.com/lathiat/avahi/commit/142124dae6f043085aba59fca4657c56b2b23b65
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/avahi/avahi.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Bernd had already sent the same patch on Monday 27, so I've applied his
patch instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
