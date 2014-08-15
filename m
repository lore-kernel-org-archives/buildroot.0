From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Aug 2014 10:19:20 +0200
Subject: [Buildroot] [PATCH] pkg-perl: fix build of perl XS packages
In-Reply-To: <1408042199-28433-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Thu, 14 Aug 2014 20:49:59 +0200")
References: <1408042199-28433-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <8761hu412v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Set OPTIMIZE in order to avoid the use of the host $Config{optimize} value
 > which could cause breakage when cross-compiling for the target.

 > See discussion in http://lists.busybox.net/pipermail/buildroot/2014-August/104129.html

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
