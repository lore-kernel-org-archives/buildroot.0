From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Jan 2016 22:01:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/sysdig: reorder select/depends
In-Reply-To: <1451678542-1376-1-git-send-email-romain.naour@gmail.com> (Romain
 Naour's message of "Fri, 1 Jan 2016 21:02:21 +0100")
References: <1451678542-1376-1-git-send-email-romain.naour@gmail.com>
Message-ID: <87wprtovyx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 >> From [1]:
 > "Even though the ordering has absolutely no consequences in Kconfig, it
 > is not logical (when reading). It is more logical and far easier to
 > understand when depends come first, followed by the selects."

 > Also, the Config.in exemple in the manual suggest to use this coding
 > style [2].

Committed both, thanks.

-- 
Bye, Peter Korsgaard
