From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 May 2017 15:14:07 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/avrdude: add linux gpio
	kconfig option
In-Reply-To: <1495120094-44581-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Thu, 18 May 2017 10:08:13 -0500")
References: <1495120094-44581-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87r2zl2dls.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > From: Sam Voss <samuel.voss@rockwellcollins.com>
 > Add the option to enable linux sysfs gpio framework
 > configure option in menuconfig.

 > Signed-off-by: Sam Voss <samuel.voss@rockwellcollins.com>
 > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

 > ---

 > Change Log

 > v1 -> v2
 >  - upstream accepted linux gpio fix, removed patch

Didn't you just agree with Baruch that we could just enable it
unconditially and not have a Config.in option for it?

-- 
Bye, Peter Korsgaard
