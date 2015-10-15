From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Oct 2015 22:11:15 +0200
Subject: [Buildroot] [PATCH 1/4] configs/raspberrypi: use EABIhf
In-Reply-To: <20151012235935.6a195741@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 12 Oct 2015 23:59:35 +0200")
References: <20150820143005.GA6441@ketchup.mtl.sfl>
 <1440273688-92868-1-git-send-email-benoit@wsystem.com>
 <20151012235935.6a195741@free-electrons.com>
Message-ID: <87k2qn6gf0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

> Applied, thanks. I actually believe we should be doing the same for all
 > ARMv6/ARMv7 platforms, except if there is a specific issue with using
 > EABIhf (such as existing pre-built binaries that are EABI only).

 > Maybe we should even use EABIhf by default on ARMv6+.

Agreed!

-- 
Bye, Peter Korsgaard
