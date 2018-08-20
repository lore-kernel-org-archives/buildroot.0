From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 17:20:39 +0200
Subject: [Buildroot] [PATCH] gr-osmosdr: add host-python-cheetah
 dependency
In-Reply-To: <20180820083933.26217-1-gwenj@trabucayre.com>
References: <20180820083933.26217-1-gwenj@trabucayre.com>
Message-ID: <20180820172039.20a4dfd6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 10:39:33 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Since b7f1b030413a51637323a755cbd985b06026990e host-python-cheetah is no more a
> dependency for gnuradio. So this package must be explicitly added for
> gr-osmosdr.
> 
> Fix : http://autobuild.buildroot.net/results/aa208a69996548c15d937fc7c97d267162a56c48/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/gr-osmosdr/gr-osmosdr.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
