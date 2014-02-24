From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Feb 2014 22:16:01 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAEAJfBPQdJC3Q7pr5tmkGsWdVW9W7cJBmPOE1OWMOKo-Kj88Q@mail.gmail.com>
References: <20140223073009.3676E101056@stock.ovh.net>
 <20140223110021.16b6b976@skate>
 <CAAEAJfBPQdJC3Q7pr5tmkGsWdVW9W7cJBmPOE1OWMOKo-Kj88Q@mail.gmail.com>
Message-ID: <20140224221601.12c4dcf1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garc?a,

On Sun, 23 Feb 2014 20:46:37 -0300, Ezequiel Garc?a wrote:
> On 23 February 2014 07:00, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> >
> >>      nios2 |                 minidlna-1.1.1 | NOK | http://autobuild.buildroot.net/results/2e6fa6e4891b5cc4c75943130158aa24fa77f26e/
> >
> > configure: error: Could not find libavformat - part of ffmpeg
> > make: *** [/home/test/test/3/output/build/minidlna-1.1.1/.stamp_configured] Error 1
> >
> > Ezequiel?
> >
> 
> Already discussed here: http://patchwork.ozlabs.org/patch/312275/
> 
> Since it seems a compiler bug, all we can do for now is disable minidlna
> for nios2 with a note about a compiler's bug.

The _gp problem seems to be occurring for a bunch of other packages. We
should contact the Sourcery CodeBench people about this, I believe.
Someone to take the lead on this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
