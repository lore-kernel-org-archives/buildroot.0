From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 20:07:22 +0100
Subject: [Buildroot] [PATCH 2/2] package/ltp-testsuite: bump version to
 20210121
In-Reply-To: <20210121191208.16756-2-petr.vorel@gmail.com> (Petr Vorel's
 message of "Thu, 21 Jan 2021 20:12:08 +0100")
References: <20210121191208.16756-1-petr.vorel@gmail.com>
 <20210121191208.16756-2-petr.vorel@gmail.com>
Message-ID: <87o8hg7pud.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Add --disable-metadata configure option. Buildroot by default disable
 > packages' doc generation.  Also generating LTP metadata documentation
 > would require have host package, which could be complicated since the
 > LTP build system is autoconf but not automake based.

 > Drop cacheflush01 patch (from this release) and rebase musl workaround
 > patch.

 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 > ---
 > Hi,

 > well I'll probably have to prepare host-ltp-testsuite package soon,
 > because we plan to have one build-time dependency from our sources,
 > but not needed so far.

OK. Committed, thanks.

-- 
Bye, Peter Korsgaard
