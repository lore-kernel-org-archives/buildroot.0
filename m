From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2021 16:52:34 +0100
Subject: [Buildroot] [PATCH v1 2/3] package/docker-engine: security bump
 to version 20.10.3
In-Reply-To: <20210210235203.2819535-2-christian@paral.in> (Christian
 Stewart's message of "Wed, 10 Feb 2021 15:52:02 -0800")
References: <20210210235203.2819535-1-christian@paral.in>
 <20210210235203.2819535-2-christian@paral.in>
Message-ID: <87tuqiiou5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Security fixes:
 >  - CVE-2021-21285 Prevent an invalid image from crashing docker daemon
 >  - CVE-2021-21284 Lock down file permissions to prevent remapped root from accessing docker state
 >  - Ensure AppArmor and SELinux profiles are applied when building with BuildKit

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed, thanks. For 2020.02.x / 2020.11.x I will instead bump to
19.03.15, which includes the same fixes.

-- 
Bye, Peter Korsgaard
