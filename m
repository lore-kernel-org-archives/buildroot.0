From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 15:36:16 +0200
Subject: [Buildroot] [PATCH next] poppler: bump version to 0.55.0
In-Reply-To: <20170522110356.29537-1-Vincent.Riera@imgtec.com>
References: <20170522110356.29537-1-Vincent.Riera@imgtec.com>
Message-ID: <20170522153616.54c70c91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 May 2017 12:03:56 +0100, Vicente Olivert Riera wrote:
> --enable-libjpeg option is now --enable-dctdecoder=libjpeg, and
> --disable-libjpeg is now --enable-dctdecoder=none. See this upstream
> commit:
>   https://cgit.freedesktop.org/poppler/poppler/commit/?id=b286a6b5b1a63563263072305da04604cb022488
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/poppler/poppler.hash | 2 +-
>  package/poppler/poppler.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
