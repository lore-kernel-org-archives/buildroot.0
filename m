From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Sep 2014 20:18:57 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140907154447.GH31418@free.fr> (Yann E. MORIN's message of
 "Sun, 7 Sep 2014 17:44:47 +0200")
References: <20140906063010.93F60101336@stock.ovh.net>
 <20140906203640.09c6d8be@free-electrons.com>
 <87lhpwmr7m.fsf@dell.be.48ers.dk>
 <20140907092158.600154db@free-electrons.com>
 <CAAXf6LWtNSM5JWfAoz9JEK16qvnEMqPR-BnpV4_kTgBnuXimVg@mail.gmail.com>
 <540C7B1F.5030902@gmail.com> <20140907154447.GH31418@free.fr>
Message-ID: <87r3znl2em.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Just my two cents:
 >> 
 >> For anything that requires user interaction like xconfig for menuconfig
 >> (for buildroot or the kernel for example), use the host's libraries -
 >> They are likely to have them installed and it will be quicker if I want
 >> to change a config option. Also, none of the config binaries will be
 >> copied to the target.
 >> 
 >> For any package that depends on ncurses to build, build host-ncurses -
 >> This provides isolation against any changes between distributions and
 >> ensures that we have control over versions.

 > I totally agree on those two points.

Yeah, sounds sensible.

Should we document this somewhere in the manual?

-- 
Bye, Peter Korsgaard
