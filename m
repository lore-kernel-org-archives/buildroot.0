From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 26 Apr 2013 16:42:45 +0200
Subject: [Buildroot] [PATCH] php: fix libxml2 build failure
In-Reply-To: <1366979990-10086-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 26 Apr 2013 09:39:50 -0300")
References: <1366979990-10086-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vc7973q2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The libxml2 build test uses the PHP_TEST_BUILD macro which in turn uses
 Gustavo> AC_TRY_RUN which is bad for cross compilations.
 Gustavo> Force php_cv_libxml_build_works to yes when libxml2 is selected. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/8b45a1260ab6ae15dc59a5d6b5b98698ec3e7bbe/

Committed, thanks.

-- 
Bye, Peter Korsgaard
