From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 23:14:08 +0200
Subject: [Buildroot] [PATCH 1/2] package/gnuradio: re-enable gr-qtgui
In-Reply-To: <20200605132432.1749068-1-gwenj@trabucayre.com>
References: <20200605132432.1749068-1-gwenj@trabucayre.com>
Message-ID: <20200606231408.641cd9e8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  5 Jun 2020 15:24:31 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Since commit fcd9c85475b65c6e8f22d5f9b4ac7c7ecb93dc6a, gr-qtgui has
> been removed. With gnuradio 3.8 serie, this block requires qt5 and
> can be re-enabled.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  Config.in.legacy             |  6 ------
>  package/gnuradio/Config.in   | 15 +++++++++++++++
>  package/gnuradio/gnuradio.mk |  8 +++++++-
>  3 files changed, 22 insertions(+), 7 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
