From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jul 2016 23:59:25 +0200
Subject: [Buildroot] [PATCH v2] toolchain: Bump ARC tools to
	arc-2016.09-eng006
In-Reply-To: <1468313301-30311-1-git-send-email-vzakhar@synopsys.com> (Vlad
 Zakharov's message of "Tue, 12 Jul 2016 11:48:21 +0300")
References: <1468313301-30311-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <87r3ay5xhe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vlad" == Vlad Zakharov <Vladislav.Zakharov@synopsys.com> writes:

 > As described at:
 > 4520524ba055706236db9f00dd79f1b2e2e87fde
 > this commit continues a series of updates of ARC tools.

 > This engineering build fixes the kernel dwarf stack unwinder feature for
 > ARC targets.

 > We still keep GDB as it is of arc-2016.03 release because there're some
 > issues we'd like to resolve before releasing it to wider audience.

 > So again note this is next engineering builds of arc-2016.09 series
 > and it might have all kinds of breakages, please don't use it for
 > production builds.

 > Related to:
 > 4520524ba055706236db9f00dd79f1b2e2e87fde

 > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
