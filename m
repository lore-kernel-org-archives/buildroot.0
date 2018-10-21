From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 14:52:53 +0200
Subject: [Buildroot] [PATCH 1/1] leveldb: fix parallel build
In-Reply-To: <20181008211351.18806-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 8 Oct 2018 23:13:51 +0200")
References: <20181008211351.18806-1-fontaine.fabrice@gmail.com>
Message-ID: <87ftwz797e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build of leveldb sometimes fails on:
 > Fatal error: can't create out-shared/db/db_bench.o: No such file or directory

 > Patch is not upstreamable as upstream switched to cmake

 > Fixes:
 >  - http://autobuild.buildroot.net/results/945bb8096c1f98f307161a6def5a9f7f25b2454a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
