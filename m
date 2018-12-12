From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Wed, 12 Dec 2018 12:25:26 -0700
Subject: [Buildroot] [PATCH v2 05/14] alsa-utils: update DEPENDENCIES to
 fftw-single
In-Reply-To: <20181212074539.11656-5-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
 <20181212074539.11656-5-gwenj@trabucayre.com>
Message-ID: <CA+1k=2Y13NO9o0tMq7YEkKLtpVvwZgRQL_n8NpcnNsNjgAsunA@mail.gmail.com>
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

Testing: compile-tested a build of alsa-utils with all the
permutations of enabling/disabling fftw-single, fftw-double, and
fftw-long-double on an aarch64 build (so no fftw-quad available)

Side-note: this patch didn't seem to end up in the same series on
patchwork... https://patchwork.ozlabs.org/project/buildroot/list/?series=81308
 and https://patchwork.ozlabs.org/patch/1011646/
