From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 23:42:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/qt5/qt5base: drop wrong
 optimization flag
In-Reply-To: <20190626140412.101607-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Wed, 26 Jun 2019 16:04:11 +0200")
References: <20190626140412.101607-1-giulio.benetti@micronovasrl.com>
Message-ID: <87k1avk5rl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > In qmake.conf.in has been left 'QMAKE_CXXFLAGS_RELEASE += -O3' but this
 > leads to not use Buildroot CXXFLAGS when building in release
 > mode(without debugging symbols). So let's remove it to let Qt5 to follow
 > Buildroot optimization flags like other packages do.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
