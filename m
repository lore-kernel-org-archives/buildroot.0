From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2011 17:19:16 +0200
Subject: [Buildroot] Some build failures to solve for volunteers
Message-ID: <20110522171916.0ba1bba7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have done a set of test builds, with a random choice of toolchain
amongst a set of internal and external toolchains I have and with a
random choice of packages. I have fixed some of the issues that occurred
multiple times, but there are many remaining issues and I won't have
the time to go through all of them.

Therefore, I've put online the results of the failed tests, with
the .config and the complete build log :

 http://free-electrons.com/~thomas/buildroot/test-output-2011-05-22/

Unfortunately, some of the builds have been done with external
toolchains, and the page above doesn't give details about the custom
external toolchains I'm using. But anyway, if people have time to go
through some of these failures and contribute fixes, that'd be really
great.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
