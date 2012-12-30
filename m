From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 Dec 2012 14:08:40 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-12-29
In-Reply-To: <50E02D8F.7020504@zacarias.com.ar> (Gustavo Zacarias's message of
 "Sun, 30 Dec 2012 09:03:27 -0300")
References: <20121230073456.2BCF452C08C@lolut.humanoidz.org>
 <87r4m7uacj.fsf@dell.be.48ers.dk> <50E02D8F.7020504@zacarias.com.ar>
Message-ID: <87ehi7u1pj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> On 12/30/2012 07:02 AM, Peter Korsgaard wrote:
 >> These two looks related to your recent gnutls version bump. Care to have
 >> a look?

 Gustavo> Running a failing config now, i don't think i'll hit it
 Gustavo> barebones though since they look like a pretty regular config.
 Gustavo> Probably have to debootstrap.

Thanks.

 >> This is probably also related to it, but perhaps that gets fixed by
 >> Thomas' e17 update.

 Gustavo> Seems unlikely from looking at the source of ecore.
 Gustavo> Since people have been using and accustomed to gnutls-2.x
 Gustavo> which required libgcrypt they've been including it blindly.
 Gustavo> I'll test to see if it really requires libgcrypt (like
 Gustavo> ntfs-3g) or it's just probably following old gnutls
 Gustavo> instructions and fix accordingly.

Great, thanks.

 >> Did you have a look at the host-gawk issue?

 Gustavo> Yes, it seems peko-specific so my hunch says it's a distro
 Gustavo> toolchain thing. I've asked Thomas and it seems it's runnig
 Gustavo> gcc 4.3.2.  Looks like the new gawk DFA is triggering a bug or
 Gustavo> using a newer feature that it shouldn't.  Couldn't reproduce
 Gustavo> yet, so an old gentoo stage or debootstrap might help me.  So
 Gustavo> also looking into it.  A puny dual-core won't help me with
 Gustavo> getting these things solved quickly though, except libecore :)

You can always request a login to the GCC compile farm if you want to
check on gcc14:

http://gcc.gnu.org/wiki/CompileFarm

-- 
Bye, Peter Korsgaard
