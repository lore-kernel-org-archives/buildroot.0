From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Oct 2013 18:39:16 +0200
Subject: [Buildroot] [PATCH] uboot-tools: fix license issues
In-Reply-To: <1382452676-2514-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 22 Oct 2013 11:37:56 -0300")
References: <1382452676-2514-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87iowpb6q3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > U-Boot 2013.10 moved licenses into the Licenses/ directory.
 > However since we target many versions of u-boot (even non-upstream
 > versions) we can't point UBOOT_TOOLS_LICENSE_FILES to the proper place
 > without making mistakes.
 > So just remove it unforunately. Fixes:
 > http://autobuild.buildroot.net/results/8c9/8c94c81fe74399c854de335329cf4942f8356fbe/

Ehh, we do support multiple versions of u-boot, but only a single
version of uboot-tools, so it makes sense to just change it to
Licenses/..

-- 
Bye, Peter Korsgaard
