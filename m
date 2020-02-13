From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 22:57:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/rocksdb: switch to
 generic-package
In-Reply-To: <20200204211348.3631258-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 4 Feb 2020 22:13:48 +0100")
References: <20200204211348.3631258-1-fontaine.fabrice@gmail.com>
Message-ID: <878sl6dual.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Switch from cmake-package to generic-package to allow rocksdb to run the
 > ./build_tools/build_detect_platform script and detect compiler options
 > such as C++17 support for -faligned-new

 > First patch needs to be updated and second patch can be dropped

 > Fixes:
 >  - http://autobuild.buildroot.org/results//22c9909c0d20e3871775f3874f7723910d7e5a41
 >  - http://autobuild.buildroot.org/results/ab7b2bc9e9653a7093d8b27d4445c28993572ca4

Dropped the extra / in the first URL and committed, thanks.

-- 
Bye, Peter Korsgaard
