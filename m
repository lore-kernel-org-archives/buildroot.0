From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 10:31:13 +0100
Subject: [Buildroot] [PATCH 2/2] package/putty: fix build with uClibc
In-Reply-To: <64b39558536fb15d8447ea0e5acb294ebba642c1.1553624840.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 26 Mar 2019 20:27:20 +0200")
References: <957950c9628264383a7a83b04c082c4b56ef5314.1553624840.git.baruch@tkos.co.il>
 <64b39558536fb15d8447ea0e5acb294ebba642c1.1553624840.git.baruch@tkos.co.il>
Message-ID: <87k1gjny5a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add patches fixing a number of build issues with uClibc. The issue fixed
 > in patch #2 has been reported upstream. Patch #3 has been suggested by
 > upstream but not applied yet.

 > Drop the _SUBDIR assignment. The configure script moved to top level
 > directory since upstream commit a947c49bec3 from 2014. This allows
 > AUTORECONF to find configure.ac.

 > Fixes:
 > http://autobuild.buildroot.net/results/801/801e2b2909363b5dcd9735362bb921e017569edc/
 > http://autobuild.buildroot.net/results/398/3984c6cdd3398645c8ad98bbe23af9090cf4bfcf/
 > http://autobuild.buildroot.net/results/632/632f93046f9cceffd9b604911542426c10967e0f/

 > Cc: Alexander Dahl <post@lespocky.de>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x, 2018.11.x and 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
