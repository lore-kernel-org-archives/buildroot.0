From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jan 2020 22:47:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump to version
 20200120
In-Reply-To: <20200120193652.3526-1-petr.vorel@gmail.com> (Petr Vorel's
 message of "Mon, 20 Jan 2020 20:36:52 +0100")
References: <20200120193652.3526-1-petr.vorel@gmail.com>
Message-ID: <87sgk9ol61.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Drop all patches. All but
 > 0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch were
 > backported from this release, this one is not needed any more due
 > upstream commit f7199c464 ("rpc-tirpc: Remove authdes related tests")

 > Thus remove also LTP_TESTSUITE_AUTORECONF.

 > Update also list of unsupported tests on musl (broken rpc-tirpc tests
 > were fixed in this release).

 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 > ---
 > Hi,

 > tested:
 > $ ./utils/test-pkg ltp-testsuite
 >                              br-arm-full [1/6]: OK
 >                   br-arm-cortex-a9-glibc [2/6]: OK
 >                    br-arm-cortex-m4-full [3/6]: SKIPPED
 >                           br-x86-64-musl [4/6]: OK
 >                       br-arm-full-static [5/6]: OK
 >                             sourcery-arm [6/6]: OK

 > Kind regards,
 > Petr

Committed, thanks.

-- 
Bye, Peter Korsgaard
