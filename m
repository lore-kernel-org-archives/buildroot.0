From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 23:26:47 +0200
Subject: [Buildroot] [PATCH 1/2] c-periphery: new package
In-Reply-To: <1431784161-5771-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 16 May 2015 15:49:20 +0200")
References: <1431784161-5771-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87382w9pt4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This package is needed as a dependency of lua-periphery. Currently,
 > c-periphery is automatically cloned by lua-periphery, which causes two
 > problems:

 >  1/ It does not integrate properly with the download infrastructure of
 >     Buildroot, making offline builds impossible since not the entire
 >     source code is downloaded by Buildroot.

 >  2/ It does not use the latest version of c-periphery, which has some
 >     fixes contributed by Vicente to fix c-periphery on MIPS.

 > Introducing this package is needed as part of the fix for the
 > following build failure:

 >   http://autobuild.buildroot.org/results/0ad/0ad656970b3cbc84b5531b28155ba2f747715fe3/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
