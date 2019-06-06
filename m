From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:35:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: fix static build
In-Reply-To: <20190531133928.19568-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 31 May 2019 15:39:28 +0200")
References: <20190531133928.19568-1-fontaine.fabrice@gmail.com>
Message-ID: <87r286g20u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > no-dso option has been removed with
 > https://github.com/openssl/openssl/commit/31b6ed76dfd53529b74e79830c81372d0b756929

 > To fix this error, use "gcc" target in static builds. This target is
 > very minimalistic, we need to manually pass -lpthread and
 > -DOPENSSL_THREADS however we can also remove libdl workarounds

 > Fixes:
 >  - http://autobuild.buildroot.org/results/96d6b89d20980e8f7fa450b832474a81d492b315

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
