From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2016 14:27:24 +0200
Subject: [Buildroot] [PATCH 7/9] toolchain: remove eglibc support
In-Reply-To: <85f0bbfe-6fa1-ad89-21b4-88d1b9c7c9c8@mind.be>
References: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1463436782-17051-8-git-send-email-thomas.petazzoni@free-electrons.com>
 <85f0bbfe-6fa1-ad89-21b4-88d1b9c7c9c8@mind.be>
Message-ID: <20160518142724.11accfb4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 May 2016 00:28:07 +0200, Arnout Vandecappelle wrote:

>   It's probably a good idea to do a "sed 's/(e)glibc/glibc/' as well. Even 
> though we still have Linaro and possibly custom external toolchains with eglibc, 
> I don't think it makes much sense anymore to make that distinction explicit.

Yes, I thought about this yesterday as well.

>   The glibc.hash file wasn't updated.
> 
>   There are also still some references to eglibc in the manual, these should 
> probably be removed.

Good points, I'll send some patches to address those issues soonish.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
