From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 29 Jan 2013 21:35:53 +0100
Subject: [Buildroot] [PATCH] olsr: bump to version 0.6.4
In-Reply-To: <1359468619-12256-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 29 Jan 2013 11:10:19 -0300")
References: <1359468619-12256-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87halzd8wm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Bump olsrd to version 0.6.4
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/553c8157cd83ca60475caacc119779c778806781/
 Gustavo> which is due to the old version not being friendly with newer flex
 Gustavo> versions.

 Gustavo> Enabled more plugins to make it more useful.

 Gustavo> Switch to forked mode in the init script to avoid console noise.

Does this mean it needs to depend on BR2_USE_MMU?

-- 
Bye, Peter Korsgaard
