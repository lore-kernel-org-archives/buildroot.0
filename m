From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jan 2013 22:15:06 +0100
Subject: [Buildroot] [PATCH] Fix installation of crosstool-ng libraries
	to target
In-Reply-To: <201301061229.18437.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 6 Jan 2013 12:29:18 +0100")
References: <1357449105-14780-1-git-send-email-bos@je-eigen-domein.nl>
 <201301061206.37057.yann.morin.1998@free.fr>
 <87hamuh8by.fsf@dell.be.48ers.dk>
 <201301061229.18437.yann.morin.1998@free.fr>
Message-ID: <87lic6dndx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 Yann> It also means that people seldom use the ct-ng backend, and
 Yann> people either use the internal backend, or external
 Yann> toolchains. So, a couple of questions:

 Yann>   - should we finally switch over to using the ct-ng backend by default?
 Yann>   - is it worth maintaing the ct-ng backend at all?

I think we all agree that the long term plan is to deprecate the
internal toolchain option. I do think that it's getting a bit late for
the current cycle, but lets discuss at the dev day and change the
default for the 2013.05 cycle if everyone agrees.

-- 
Bye, Peter Korsgaard
