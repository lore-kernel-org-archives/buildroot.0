From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 14:41:06 +0200
Subject: [Buildroot] [arc-buildroot] Re: [PATCH] toolchain: Bump ARC
 tools to arc-2018.03-rc2
In-Reply-To: <90d3e805ed43935439cc662364db4166d5193748.camel@synopsys.com>
 (Alexey Brodkin's message of "Mon, 28 May 2018 08:54:10 +0000")
References: <20180525180701.24796-1-Evgeniy.Didin@synopsys.com>
 <877enq96f5.fsf@dell.be.48ers.dk>
 <90d3e805ed43935439cc662364db4166d5193748.camel@synopsys.com>
Message-ID: <87vab8ymu5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Hi Peter,
 > On Sat, 2018-05-26 at 10:18 +0200, Peter Korsgaard wrote:
 >> > > > > > "Evgeniy" == Evgeniy Didin <Evgeniy.Didin@synopsys.com> writes:
 >> 
 >> > This commit bumps ARC toolchain to arc-2018.03-rc2, which
 >> > includes significant changes since arc-2018.03-rc1.
 >> > We want to test how new toolchain-rc2 builds packages,
 >> > so we can make fixes before release of toolcain.
 >> > This makes us closer to toolchain release which will be in a few weeks.
 >> 
 >> > Please note that it is a release candidate
 >> > and it might contain some breakages, 
 >> > please don't use it for production builds.
 >> 
 >> > Signed-off-by: Evgeniy Didin <didin@synopsys.com>
 >> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 >> > Cc: arc-buildroot at synopsys.com
 >> 
 >> Committed to next, thanks.

 > Maybe it worth applying to the current master as this is a change of
 > RC1 (e have today in master) to RC2 that only has a couple fixes on top
 > of RC1. I.e. it is supposed to bring stability in the release but not
 > introduce new features etc.

Ok, that wasn't clear from the commit message. I can apply it on master
as well if you prefer.

-- 
Bye, Peter Korsgaard
