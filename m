From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 09:54:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/apitrace: disable unit tests
In-Reply-To: <20201222104411.1250878-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 22 Dec 2020 11:44:11 +0100")
References: <20201222104411.1250878-1-fontaine.fabrice@gmail.com>
Message-ID: <87zh24j418.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This will avoid the following build failure with xtensa:
 > [ 62%] Linking CXX executable ../../guids_test
 > [ 62%] Building CXX object retrace/CMakeFiles/retrace_common.dir/retrace.cpp.o
 > CMakeFiles/guids_test.dir/guids_test.cpp.o:(.debug_line+0xf7b):
 > dangerous relocation: overflow after relaxation
 > collect2: error: ld returned 1 exit status
 > lib/guids/CMakeFiles/guids_test.dir/build.make:85: recipe for target 'guids_test' failed

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8fea93a88bb34e98e391a048c3b996b45ebac803

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
