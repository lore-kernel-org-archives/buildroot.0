From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Aug 2016 08:05:41 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
	arc-2016.09-eng010
In-Reply-To: <1472579520-27726-1-git-send-email-vzakhar@synopsys.com> (Vlad
 Zakharov's message of "Tue, 30 Aug 2016 20:52:00 +0300")
References: <1472579520-27726-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <878tvd1nii.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vlad" == Vlad Zakharov <Vladislav.Zakharov@synopsys.com> writes:

 > As described at:
 > 4520524ba055706236db9f00dd79f1b2e2e87fde
 > this commit continues a series of updates of ARC tools.
 > This time we're updating tools to arc-2016.09-eng010.

 > This engenering build contains different fixes done to TLS and
 > PIE features. Appropriate custom patches are removed as they have
 > been added to eng010.

 > We still keep GDB as it is of arc-2016.03 release because there're some
 > issues we'd like to resolve before releasing it to wider audience.

 > So again note this is next engineering builds of arc-2016.09 series
 > and it might have all kinds of breakages, please don't use it for
 > production builds.

So what do we do for 2016.08 that we are just about to release?

Should I add it or should I wait until after the release?

-- 
Venlig hilsen,
Peter Korsgaard 
