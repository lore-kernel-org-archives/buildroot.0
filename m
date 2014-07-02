From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jul 2014 17:11:44 +0200
Subject: [Buildroot] [PATCH] crda: needs dynamic library support
In-Reply-To: <1404305508-30330-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 2 Jul 2014 09:51:48 -0300")
References: <1404305508-30330-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8761jfdccv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/d75/d752a8d53ad9219b60113075c91c4dcc3e4027c1/

 > Even if the build system were fixed to deal with that it's only really
 > useful for systemd/udev scenarios with require dynamic libs as well.
 > For static scenarios people should look at using
 > CONFIG_CFG80211_INTERNAL_REGDB in the kernel.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
