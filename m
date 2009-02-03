From: Sven Neumann <s.neumann@phase-zero.de>
Date: Tue, 03 Feb 2009 15:08:45 +0100
Subject: [Buildroot] how to change compiler flags for a specific package
In-Reply-To: <8763jrfzsv.fsf@macbook.be.48ers.dk>
References: <1233664525.6263.3.camel@sven> <8763jrfzsv.fsf@macbook.be.48ers.dk>
Message-ID: <1233670125.6263.4.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2009-02-03 at 13:52 +0100, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@phase-zero.de> writes:
> 
>  Sven> Hi,
>  Sven> I have a question about buildroot. I need to compile a specific package
>  Sven> with different compiler flags than the default. By default -Os is used
>  Sven> in my buildroot setup, but as this triggers a compiler bug when
>  Sven> compiling flac, I would like to change this to -O2 for the flac package
>  Sven> (which uses Makefile.autotools.in). What is the best way to do that?
> 
> For what arch, and what goes wrong exactly?

Details can be found in
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=39076

> You can probably put your alternative CFLAGS in FLAC_MAKE_ENV or
> FLAC_MAKE_OPT to get the package to use it.

I'll try that. Thanks.


Sven
