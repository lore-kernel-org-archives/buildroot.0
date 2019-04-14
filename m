From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 23:19:05 +0200
Subject: [Buildroot] [PATCH] package/android-tools: host-android-tools
 need pkg-conf
In-Reply-To: <20190409131754.24516-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Tue, 9 Apr 2019 15:17:54 +0200")
References: <20190409131754.24516-1-giulio.benetti@micronovasrl.com>
Message-ID: <878swcgu9i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > Host version of this package needs pkg-conf the same way as target
 > package: for Makefiles library dependencies retrieving.

 > Set HOST_ANDROID_TOOLS_DEPENDENCIES = $(ANDROID_TOOLS_DEPENDENCIES) to
 > provide host-pkg-conf.

 > Fixes:
 > http://autobuild.buildroot.net/results/854/8543eb3815a67747349a2e60654d19b9804a3a89/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
