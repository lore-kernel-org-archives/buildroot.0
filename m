From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jun 2019 11:04:04 +0200
Subject: [Buildroot] [PATCHv3 2/2] utils/test-pkg: clean output dir for
 successful builds
In-Reply-To: <20190623165923.GJ13664@scaer> (Yann E. MORIN's message of "Sun, 
 23 Jun 2019 18:59:23 +0200")
References: <20190205212142.2244-1-patrickdepinguin@gmail.com>
 <20190205212142.2244-2-patrickdepinguin@gmail.com>
 <20190623165923.GJ13664@scaer>
Message-ID: <87wohahw8r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Thomas, All,
 > On 2019-02-05 22:21 +0100, Thomas De Schampheleire spake thusly:
 >> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 >> 
 >> test-pkg will use gigabytes of space when testing all toolchains.
 >> Nevertheless, you are normally only interested in the actual build / host
 >> tree when there is a build failure.
 >> 
 >> Do a 'make clean' for successful builds to save disk space, unless the new
 >> option '-k/--keep' is set.
 >> Note that the logfile and configuration is always retained for inspection.
 >> 
 >> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

 > Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

While not strictly a bugfix, the risk seems quite low and it is nicer to
keep the tooling the same in the supported branches, so:

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
