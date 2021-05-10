From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 May 2021 09:06:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/putty: fix build on uclibc
In-Reply-To: <20210509133412.1116330-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 9 May 2021 15:34:12 +0200")
References: <20210509133412.1116330-1-fontaine.fabrice@gmail.com>
Message-ID: <87v97rt6ef.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build failure on uclibc raised since bump to version 0.75 in commit
 > d562009f7b9701cb20bc4b1d389d19f9a647cc3b

 > Fixes:
 >  - http://autobuild.buildroot.org/results/726f7c5ce13e78ed91e827b872e9d7ccfa13f298

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
