From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 13:50:44 +0200
Subject: [Buildroot] [PATCH v2] package/gr-osmosdr: bump to 0.2.0
In-Reply-To: <20200411093353.22655-1-gwenj@trabucayre.com>
References: <20200411093353.22655-1-gwenj@trabucayre.com>
Message-ID: <20200412135044.036fbd93@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 11:33:53 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Since, gr-osmosdr is python3 only, drop everything related to python2.
> python-cheetah is no more mandatory, so drop this too.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v1 -> v2:
>  * depends on BR2_PACKAGE_PYTHON3 is only mandatory when BR2_PACKAGE_GR_OSMOSDR_PYTHON is set (Thomas)
> ---
>  package/gr-osmosdr/Config.in       | 1 +
>  package/gr-osmosdr/gr-osmosdr.hash | 2 +-
>  package/gr-osmosdr/gr-osmosdr.mk   | 8 ++++----
>  3 files changed, 6 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
