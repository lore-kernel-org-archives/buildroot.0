From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 15:50:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/kf5: fix _LICENSE_FILE ->
 _LICENSE_FILES typos
In-Reply-To: <20190920080843.18586-1-nicolas.carrier@orolia.com> (Nicolas
 Carrier's message of "Fri, 20 Sep 2019 08:08:52 +0000")
References: <20190920080843.18586-1-nicolas.carrier@orolia.com>
Message-ID: <87v9t93nc5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Carrier <nicolas.carrier@orolia.com> writes:

 > This fixes WARNINGs in make legal-info of the kind:
 >     WARNING: kf5-extra-cmake-modules-5.47.0: cannot save license
 >     (KF5_EXTRA_CMAKE_MODULES_LICENSE_FILES not defined)

 > Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
