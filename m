From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Feb 2019 17:08:26 +0100
Subject: [Buildroot] [PATCH 1/1] libgeotiff: fix build without C++
In-Reply-To: <20190203223524.19304-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Feb 2019 23:35:24 +0100")
References: <20190203223524.19304-1-fontaine.fabrice@gmail.com>
Message-ID: <87bm39axl1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Do not check for C++ compiler as libgeotiff is written in C otherwise
 > build will fail on toolchains without a working C++ compiler:

 > checking how to run the C++ preprocessor... /lib/cpp
 > configure: error: in
 > `/data/buildroot/buildroot-test/instance-1/output/build/libgeotiff-1.4.2':
 > configure: error: C++ preprocessor "/lib/cpp" fails sanity check

 > Fixes:
 >  - http://autobuild.buildroot.org/results/72f1c5c1b8fc337a1cff4b280abe99afd65f945b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
