From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2011 13:58:43 +0100
Subject: [Buildroot] cross compile python 2.6.5
In-Reply-To: <AANLkTimMH6XCuPH7vyMr8RBy=M+XT=ZQeNn90h7t=D6X@mail.gmail.com>
References: <AANLkTik0RWJA=Yqf2mMetqNQQbCse66Q8wzcO5Uhmr8-@mail.gmail.com>
	<20110308090817.6dea632b@surf>
	<AANLkTimMH6XCuPH7vyMr8RBy=M+XT=ZQeNn90h7t=D6X@mail.gmail.com>
Message-ID: <20110308135843.62a06e55@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please do not reply to me directly, but to the list.

On Tue, 8 Mar 2011 04:03:03 -0800
bao bui <buiqbao@gmail.com> wrote:

> Thanks for reply.
> 
> I downloaded my buildroot version in October last year. It has the
> Python 2.4.5 version.

Yes, we have updated the Python version in 2011.02.

> How can I the Python version in my current buildroot?

The easiest way is quite certainly to upgrade your Buildroot version to
2011.02. Going this way would allow you to have the support from the
community.

The other way is to backport the patches that bump Python, ie at least:

afe54f1008dee29af6338d8766381aad9e2871bd
d82df10e90ee9457ea0baba2d6a766149d4b7c38
10e1927e1a1bc21785b9482fc4ba70d3b4773854
05ac95e04d0b9867194492f75f4713498e2ab7df
e3418f69cf2f17d54dfb521adedbe8abf6e35927

There many be dependencies on other patches as well, it's hard to say.
Going this way, you probably won't have much support from the community.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
