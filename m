From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Jun 2021 21:44:22 +0200
Subject: [Buildroot] [PATCH] package/bluez5_utils: Clean up descriptions
In-Reply-To: <20210421131724.471288-1-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Wed, 21 Apr 2021 15:17:23 +0200")
References: <20210421131724.471288-1-buildroot@heine.tech>
Message-ID: <87v96780kp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@busybox.net> writes:

 > The descriptions in this package have grown pretty confusing over time.
 > Try to make this a bit more consistent and up-to-date.

 > * drop references to old kernel versions not supported by BR anymore
 > * Remove "Bluez 5.x" string from options
 > * consistently use the term "plugin" (plugins implement profiles)
 > * make mentioned profile appreviations upper-case
 > * make descriptions closer to the ones in BlueZ Readme [0]
 > * make clear that "tests" refers to the python test scripts

 > [0] https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/README?h=5.58

 > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
