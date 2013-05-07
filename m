From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 May 2013 23:02:16 +0200
Subject: [Buildroot] [PATCH] toolchain/crostool-NG: mark as deprecated
In-Reply-To: <1367880422-12739-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 7 May 2013 00:47:02 +0200")
References: <1367880422-12739-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87zjw6zep3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> For the following reasons:
 Yann>   - it used to be broken without anyone noticing for a long time,
 Yann>   - it is still not fully integrated within the Buildroot set of options,
 Yann>   - it has not gained much traction (not even I use it),
 Yann>   - I've always argued that sustained development should use an external
 Yann>     toolchain, and not rely on building one with Buildroot,
 Yann>   - I did not submit any of the enhancements requested during the last
 Yann>     developpers' day in Brussels,
 Yann>   - I have neither the incentive nor the time to maintain and enhance it,

 Yann> it is time to deprecate the crosstool-NG backend for the 2013.05 release.

 Yann> Then, it will be entirely removed early in the 2013.08 cycle, to let some
 Yann> time for those that rely on it to voice their opinions. ;-)

Committed, thanks.

-- 
Bye, Peter Korsgaard
