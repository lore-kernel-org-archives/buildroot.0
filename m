From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 21:00:33 +0100
Subject: [Buildroot] [PATCH] mpv: disable with ARC external toolchain
In-Reply-To: <1488295294-27834-1-git-send-email-vzakhar@synopsys.com> (Vlad
 Zakharov's message of "Tue, 28 Feb 2017 18:21:34 +0300")
References: <1488295294-27834-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <87poi2hyqm.fsf@dell.be.48ers.dk>
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
 >   http://autobuild.buildroot.net/results/fb6/fb677a917545adee321bdcd2c2519c81326448c4//

 > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
