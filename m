From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Apr 2018 17:07:58 +0200
Subject: [Buildroot] Patch for opencv3: python module was built for the
 host instead of target.
In-Reply-To: <MW2PR02MB3724CAF4A9F9EF9FEBF4C35E95D90@MW2PR02MB3724.namprd02.prod.outlook.com>
 (Sasha Shyrokov's message of "Tue, 6 Mar 2018 17:19:18 +0000")
References: <MW2PR02MB3724CAF4A9F9EF9FEBF4C35E95D90@MW2PR02MB3724.namprd02.prod.outlook.com>
Message-ID: <87h8old9dd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Shyrokov," == Shyrokov, Sasha <Sasha-Shyrokov@idexx.com> writes:

 > From 9b211fb5ec49879d10d32d22ed3608ffca944e2d Mon Sep 17 00:00:00 2001
 > From: Sasha Shyrokov <alexander-shyrokov@idexx.com>
 > Date: Tue, 6 Mar 2018 10:58:10 -0500
 > Subject: [PATCH 1/1] opencv3: python module was built for the host instead of target.

 > distutils environment variables must be set.
 > OPENCV3_CONF_ENV = $(PKG_PYTHON_DISTUTILS_ENV) All credit goes to Arnout:
 > https://stackoverflow.com/questions/49059035/buildroot-opencv3-python-package-builds-for-the-wrong-target

 > Signed-off-by: Sasha Shyrokov <alexander-shyrokov@idexx.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
