From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Mar 2012 17:02:02 +0200
Subject: [Buildroot] toolchain choice of thread version to use.
In-Reply-To: <8DDFBCE319CD4D5687FE5D4BB6B93B25@JohanW7>
References: <8DDFBCE319CD4D5687FE5D4BB6B93B25@JohanW7>
Message-ID: <201203261702.05945.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 26 March 2012 11:01:19 Sagaert Johan wrote:
> Is there any difference between selecting the type of threads in the buildroot ->toolchain menuconfig versus selecting the thread
> lib type in the menuconfig of uClibc ?

 Buildroot modifies the uClibc .config file with some of the settings
from the buildroot .config.  One of these settings is the type of
threads.  So whatever thread setting you make in the uClibc config
should vanish as soon as you compile uClibc.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
