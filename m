From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 22:17:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/beecrypt: fix build without C++
In-Reply-To: <20190301201818.24561-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 1 Mar 2019 21:18:18 +0100")
References: <20190301201818.24561-1-fontaine.fabrice@gmail.com>
Message-ID: <875zs6k60x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Do not check for C++ compiler as C++ support has been disabled since
 > commit dd4d3c18d6753e1224fbe59d91a4b44f39bc38c0 otherwise
 > build will fail on toolchains without a working C++ compiler:

 > checking how to run the C++ preprocessor... /lib/cpp
 > configure: error: in `/data/buildroot/buildroot-test/instance-1/output/build/beecrypt-4.2.1':
 > configure: error: C++ preprocessor "/lib/cpp" fails sanity check

 > Fixes:
 >  - http://autobuild.buildroot.org/results/3c79cc68f1b088ad24daf7f9bd70718d702be577

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x, 2018.11.x and 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
