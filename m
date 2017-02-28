From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 21:00:39 +0100
Subject: [Buildroot] [PATCH] xterm: disable with ARC external toolchain
In-Reply-To: <1488295216-26882-1-git-send-email-vzakhar@synopsys.com> (Vlad
 Zakharov's message of "Tue, 28 Feb 2017 18:20:16 +0300")
References: <1488295216-26882-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <87lgsqhyqg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vlad" == Vlad Zakharov <Vladislav.Zakharov@synopsys.com> writes:

 > This package fails when building with ARC external toolchain
 > Marking this with special comment "# ARC toolchain issue" as the package
 > is to be enabled as soon as the issue with the ARC toolchain is
 > resolved.

 > Fixes:
 >   http://autobuild.buildroot.net/results/28a/28a92049a6ceef005787c5779f77ecf3fe8ad642//

 > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
