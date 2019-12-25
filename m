From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 19:07:11 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/qt5/qt5webengine: fix build
 error
In-Reply-To: <20191221111218.26960-1-b.bilas@grinn-global.com> (Bartosz
 Bilas's message of "Sat, 21 Dec 2019 12:12:18 +0100")
References: <20191221111218.26960-1-b.bilas@grinn-global.com>
Message-ID: <87o8vws2i8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Bilas <b.bilas@grinn-global.com> writes:

 > This commit adds a patch from upstream chromium [1].
 > Fixes:
 >   ../../3rdparty/chromium/third_party/skia/third_party/skcms/skcms.cc:1909:16:
 >   note: in definition of macro 'NS'
 >   #define NS(id) id

 > [1] https://chromium.googlesource.com/chromium/src/+/a8c8396fd20d98666d517c45b358c63736e345ef

 > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
 > ---
 > v1 -> v2:
 >  - keep gcc 4.8 as a minimum required version (suggested by Giulio Benetti)

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
