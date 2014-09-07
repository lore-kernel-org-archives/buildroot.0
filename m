From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Sep 2014 14:26:59 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAXf6LWtNSM5JWfAoz9JEK16qvnEMqPR-BnpV4_kTgBnuXimVg@mail.gmail.com>
References: <20140906063010.93F60101336@stock.ovh.net>
 <20140906203640.09c6d8be@free-electrons.com>
 <87lhpwmr7m.fsf@dell.be.48ers.dk>
 <20140907092158.600154db@free-electrons.com>
 <CAAXf6LWtNSM5JWfAoz9JEK16qvnEMqPR-BnpV4_kTgBnuXimVg@mail.gmail.com>
Message-ID: <20140907142659.29b17d8b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 7 Sep 2014 14:17:21 +0200, Thomas De Schampheleire wrote:

> An alternative is to use the suitable-host-package mechanism in such
> cases: if the host does have ncurses (but the same could be done for
> autoconf, automake, flex, bison, and other host packages) then build
> it inside buildroot. If it does, then just use them directly.
> Since the build of host-ncurses does take some time, it may be
> advantageous for the user to install ncurses on the host anyway, to
> avoid long build times, so a notice at the end of the build process to
> suggest that could be useful.

That's one option indeed, but I must say I don't like it that much. It
means that from one user to the other, the build behavior will be
different, not really a great thing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
