From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 08:38:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: security bump to
 version 0.20.1
In-Reply-To: <20201109204040.546966-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 9 Nov 2020 21:40:40 +0100")
References: <20201109204040.546966-1-fontaine.fabrice@gmail.com>
Message-ID: <87361hr78y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - openssl is not a dependency since version 0.20.0 and
 >   https://github.com/bitcoin/bitcoin/commit/8983ee3e6dd8ab658bd2caf97c326cc53ea50818
 > - boost chrono is not needed since version 0.20.0 and
 >   https://github.com/bitcoin/bitcoin/commit/bd37f2bc26158f85ef1ab73b9ca1fc0da8ea562a
 > - Update hash of COPYING (update in year:
 >   https://github.com/bitcoin/bitcoin/commit/8dc9aa90c3c7990dd5b491937ddc0e39bc929d1c)
 > - Update indentation in hash file (two spaces)
 > - Tag as a security bump as having an up to date bitcoin is important:
 >   https://patchwork.ozlabs.org/project/buildroot/patch/20200202085526.35742-1-james.hilliard1 at gmail.com

I was hessitating if we should apply this for master and next, but as
there is stil some time to go before 2020.11 is released, I went for
master, thanks.

 > https://github.com/bitcoin/bitcoin/blob/master/doc/release-notes/release-notes-0.20.1.md
 > https://github.com/bitcoin/bitcoin/blob/master/doc/release-notes/release-notes-0.20.0.md
 > https://github.com/bitcoin/bitcoin/blob/master/doc/release-notes/release-notes-0.19.1.md

The release notes mentions that you should build with
'BITCOIN_GENBUILD_NO_GIT=1 make', but you don't do that?

-- 
Bye, Peter Korsgaard
