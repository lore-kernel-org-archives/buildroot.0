From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 00:02:05 +0200
Subject: [Buildroot] [PATCH 1/1] cutelyst: depends on C++11
In-Reply-To: <20180827165404.22151-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 27 Aug 2018 18:54:04 +0200")
References: <20180827165404.22151-1-fontaine.fabrice@gmail.com>
Message-ID: <87tvnf79k2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > thread-local storage is a C++11 feature available since gcc 4.8:
 > https://gcc.gnu.org/projects/cxx-status.html#cxx11

 > Fixes:
 >  - http://autobuild.buildroot.net/results/2963bd55cd7c33ded3e5a75fc86079acfae844c1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
