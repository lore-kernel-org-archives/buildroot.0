From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 23:24:24 +0100
Subject: [Buildroot] [PATCH 1/1] supertuxkart: fix build on bdver3
In-Reply-To: <20181110142041.17651-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 10 Nov 2018 15:20:41 +0100")
References: <20181110142041.17651-1-fontaine.fabrice@gmail.com>
Message-ID: <87mupw23tz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Retrieve upstream patch to fix build failure in
 > lib/graphics_utils/mipmap/cpusimd.h due to direct inclusion of
 > intrinsics headers:
 > https://github.com/supertuxkart/stk-code/issues/3091

 > Fixes:
 >  - http://autobuild.buildroot.org/results/52bd5c45b0d04a863a2530d388899b3e46494ee9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
