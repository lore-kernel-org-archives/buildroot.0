From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Wed, 12 Dec 2018 12:34:35 -0700
Subject: [Buildroot] [PATCH v2 11/14] imagemagick: reference explicitly
 fftw double
In-Reply-To: <20181212074539.11656-11-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
 <20181212074539.11656-11-gwenj@trabucayre.com>
Message-ID: <CA+1k=2ZynLWJsnS3kcXOt0owvZye1gCy-t4qze9QTETX8nUh4w@mail.gmail.com>
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

Testing: compile-tested a build of imagemagick with all the
permutations of enabling/disabling fftw-single, fftw-double, and
fftw-long-double on an aarch64 build (so no fftw-quad available)
