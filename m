From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 08:09:41 +0100
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2016.09
	release
In-Reply-To: <20161219121157.5040-1-vzakhar@synopsys.com> (Vlad Zakharov's
 message of "Mon, 19 Dec 2016 15:11:57 +0300")
References: <20161219121157.5040-1-vzakhar@synopsys.com>
Message-ID: <87fulh69my.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vlad" == Vlad Zakharov <Vladislav.Zakharov@synopsys.com> writes:

 > As described at:
 > 4520524ba055706236db9f00dd79f1b2e2e87fde
 > this commit continues a series of updates of ARC tools.

 > This time we're updating tools to arc-2016.09 release version.

I see that arc-2016.09 still dies with internal compiler errors when
building trousers:

http://autobuild.buildroot.net/?reason=trousers-0.3.13

What should we do about that?

-- 
Bye, Peter Korsgaard
