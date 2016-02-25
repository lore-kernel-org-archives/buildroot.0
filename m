From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2016 10:57:28 +0100
Subject: [Buildroot] [PATCH 2/2] gcc: remove 4.5.x
In-Reply-To: <20160225104848.2f5d892f@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 25 Feb 2016 10:48:48 +0100")
References: <1456336840-14890-1-git-send-email-gustavo@zacarias.com.ar>
 <1456336840-14890-2-git-send-email-gustavo@zacarias.com.ar>
 <87io1d3mhr.fsf@dell.be.48ers.dk>
 <20160225104848.2f5d892f@free-electrons.com>
Message-ID: <87h9gxxgc7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Wed, 24 Feb 2016 21:02:40 +0100, Peter Korsgaard wrote:

 >> What do we do with our 4.5 based external toolchains and
 >> BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 (used by directfb)?

 > I think the BR2_TOOLCHAIN_GCC_AT_LEAST_* must be kept for pretty much
 > all versions of gcc. This symbol is not related to whether we support
 > that gcc version in our internal toolchain backend or not. Possibly any
 > gcc version can be used with the external toolchain backend.

True, but we might consider removing preconfigured external toolchains
using ancient versions if there's sensible newer alternatives available.

-- 
Venlig hilsen,
Peter Korsgaard 
