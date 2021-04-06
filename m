From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Apr 2021 11:26:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/coreutils: fix build without
 threads
In-Reply-To: <20210404191944.3439677-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 4 Apr 2021 21:19:44 +0200")
References: <20210404191944.3439677-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2dvkbm3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build of coreutils without threads is broken since bump to version 8.32
 > in commit b4a0f9fb0e45aded46eb7259e25a1113eabf93c0

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8d00bdabef73daa2a1d1f4c6e183dda447a82134

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
