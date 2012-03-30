From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Mar 2012 13:52:34 +0200
Subject: [Buildroot] [PATCH 5/7] psmisc: bump to version 22.16
In-Reply-To: <863cdef0cedcf207977015eeec5c8357@zacarias.com.ar> (Gustavo
 Zacarias's message of "Fri, 30 Mar 2012 08:37:45 -0300")
References: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
 <1332987903-12378-5-git-send-email-gustavo@zacarias.com.ar>
 <87sjgrdq3g.fsf@macbook.be.48ers.dk>
 <90ff39765efa093002706980f59b4233@zacarias.com.ar>
 <87fwcqe4ti.fsf@macbook.be.48ers.dk>
 <863cdef0cedcf207977015eeec5c8357@zacarias.com.ar>
Message-ID: <877gy2e265.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> Shouldn't we push -fstack-protector into CFLAGS in the toolchain infra
 Gustavo> when the option is enabled?
 Gustavo> AFAIK if you build stack protector support without using a form of
 Gustavo> -fstack-protector* in CFLAGS then the packages won't use it, right?
 Gustavo> And if we leave it to each package to do it then we're just giving a
 Gustavo> false sense of security with that option.
 Gustavo> On a side note, avahi is forcing stack protector off too since
 Gustavo> memorial times, maybe that should be revised?

Yes, I also think our SSP support could be improved. Anyone knows /
cares enough of it to do so?

-- 
Bye, Peter Korsgaard
