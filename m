From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 21:08:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/micropython: fix license hash
In-Reply-To: <20200915172035.6871-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 15 Sep 2020 19:20:35 +0200")
References: <20200915172035.6871-1-fontaine.fabrice@gmail.com>
Message-ID: <87lfharh6g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 7676191cfacbdb1a92af1d0218d3280207b03090 forgot to update
 > license hash which changed due to an update in year:
 > https://github.com/micropython/micropython/commit/338b12d3c840ea56504c83d9c51e4d0f628684f4

 > While at it, also update indentation in hash file (two spaces)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/2a650636965d8575374333f847acc169caf8d2ac

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
