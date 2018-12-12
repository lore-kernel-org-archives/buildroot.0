From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Wed, 12 Dec 2018 12:33:00 -0700
Subject: [Buildroot] [PATCH v2 09/14] use select instead of depend for
 fftw package and fix DEPENDENCIES
In-Reply-To: <20181212074539.11656-9-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
 <20181212074539.11656-9-gwenj@trabucayre.com>
Message-ID: <CA+1k=2ZJc=-0qENyvAJPXVYJ56-0TirWYBQFquX4hF9U0UTptg@mail.gmail.com>
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
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Reviewed-by: Joel Carlson <JoelsonCarl@gmail.com>
Tested-by: Joel Carlson <JoelsonCarl@gmail.com>

Testing: compile-tested a build of hackrf with all the permutations of
enabling/disabling fftw-single, fftw-double, and fftw-long-double on
an aarch64 build (so no fftw-quad available). Only built hackrf with
permutations where I wanted FFTW_SINGLE enabled, since it selects it.
