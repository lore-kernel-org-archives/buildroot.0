From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Jan 2013 12:44:15 +0100
Subject: [Buildroot] [PATCH] alsa-lib: fix build failures for nommu
In-Reply-To: <1357385443-31702-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 5 Jan 2013 08:30:43 -0300")
References: <1357385443-31702-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lic7kg6o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Disable the pcm_shm plugin (aserver) and alisp for nommu systems since
 Gustavo> they use fork()
 Gustavo> Fixes
 Gustavo> http://autobuild.buildroot.net/results/7e59e73e516579045538e7cc0efbc22744a45d75

Committed, thanks.

-- 
Bye, Peter Korsgaard
