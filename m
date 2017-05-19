From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 May 2017 16:39:15 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/avrdude: add linux gpio
 kconfig option
In-Reply-To: <CANQCQpagwa4KgHS0gw-YL_U2-KUV5_tuFM5a0gqt_1TahN6Vjw@mail.gmail.com>
References: <1495120094-44581-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87r2zl2dls.fsf@dell.be.48ers.dk>
 <CANQCQpagwa4KgHS0gw-YL_U2-KUV5_tuFM5a0gqt_1TahN6Vjw@mail.gmail.com>
Message-ID: <20170519163915.1b083a46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 May 2017 08:58:25 -0500, Matthew Weber wrote:

> Not sure we reached a conclusion.  I guess the question would be,
> right now in buildroot it doesn't enable this option.  So if we by
> default go linux-gpio it disables the legacy options which were the
> previous default (kernel's older then sysfs gpio support).  I'm good
> either way, but the fundamental package behavior changes.

Package behavior also changes every time we bump a package. So Baruch's
question was whether the size impact was significant or not. If it's
not, then no need to make an option for it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
