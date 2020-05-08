From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2020 14:56:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: disable tests and
 cpack docs
In-Reply-To: <20200425195608.9627-1-danomimanchego123@gmail.com> (Danomi
 Manchego's message of "Sat, 25 Apr 2020 15:56:08 -0400")
References: <20200425195608.9627-1-danomimanchego123@gmail.com>
Message-ID: <87tv0qpoun.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > paho-mqtt-c by default enables the building of test materials and
 > install of CPack documentation:

 > PAHO_ENABLE_TESTING - "Build tests and run"
 > PAHO_ENABLE_CPACK - "Enable CPack"

 > Let's disable these to save a couple megabytes and time.  This is
 > in keeping with the generic settings in pkg-cmake.mk.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
