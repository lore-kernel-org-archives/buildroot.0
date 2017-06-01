From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:43:09 +0200
Subject: [Buildroot] [PATCH] package/hans: fix build failures with high
	'make -j' values
In-Reply-To: <20170531191249.18287-1-romain.naour@gmail.com> (Romain Naour's
 message of "Wed, 31 May 2017 21:12:49 +0200")
References: <20170531191249.18287-1-romain.naour@gmail.com>
Message-ID: <87o9u7hipu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The top-level doesn't handle correctly the build dependencies
 > between .o files.

 > Since hans doesn't take too many time to build, just use MAKE1.

 > Fixes:
 > http://autobuild.buildroot.net/results/d14/d142f4a439d4d5fcc89865abde3e593c45ad5d96
 > http://autobuild.buildroot.net/results/28e/28ed230e40cc154db9274f9765085cd7f0eee85a
 > http://autobuild.buildroot.net/results/900/9008c3be3bcf46f0fc21a34f48e3cf9da1397d9a

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
