From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 13 Feb 2018 01:42:46 -0200
Subject: [Buildroot] [PATCH 13/14] support/dockerfile: allow to install
 packages
References: <20180203152615.GL2369@scaer>
Message-ID: <5a825eb681933_51963fbb9caa29f84752a@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Feb 03, 2018 at 01:26 PM, Yann E. MORIN wrote:

> On 2018-01-21 22:44 -0200, Ricardo Martincoski spake thusly:
>> Some tools in the Docker image can be useful to a single test only.
>> Allow tests to install packages on the fly instead of adding everything
>> to the base Docker image.
> 
> I think I would prefer that our base image has all the tools we need.

I will do, if no one argues against.
To me, this patch is only a means to an end.
I am happy with any solution.

In the past Arnout suggested the opposite way
http://lists.busybox.net/pipermail/buildroot/2017-October/205253.html
but that was before we started to use the image as br-user.

Regards,
Ricardo
