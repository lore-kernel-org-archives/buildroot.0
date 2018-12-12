From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Wed, 12 Dec 2018 12:21:00 -0700
Subject: [Buildroot] [PATCH v2 03/14] fftw: breaks fftw-quad into a
 dedicated package
In-Reply-To: <20181212074539.11656-3-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
 <20181212074539.11656-3-gwenj@trabucayre.com>
Message-ID: <CA+1k=2bhosAaCEeJH3kUMGmSirK85+ydhdVR5TT9wqNNsNsVDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 12, 2018 at 12:45 AM Gwenhael Goavec-Merou
<gwenj@trabucayre.com> wrote:
>
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>
> fftw's library name depends on the precision option. Consequently,
> it's possible to install multiple flavor on the same target.
>
> This patch breaks fftw quad precision into a new package and:
> - deprecates BR2_PACKAGE_FFTW_PRECISION_QUAD, BR2_PACKAGE_FFTW_QUAD
>   must be used instead;
> - do fftw depends on fftw-long-quad when this package is enabled.
>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Reviewed-by: Joel Carlson <JoelsonCarl@gmail.com>
