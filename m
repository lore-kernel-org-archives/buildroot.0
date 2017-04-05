From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 11:28:58 +0200
Subject: [Buildroot] Pre-built toolchain updates
In-Reply-To: <20170404131513.6c48f30e@free-electrons.com>
References: <20170404131513.6c48f30e@free-electrons.com>
Message-ID: <20170405112858.6b085275@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Apr 2017 13:15:13 +0200, Thomas Petazzoni wrote:

> I've updated all the Buildroot pre-built toolchains. The main changes
> are:
> 
>  - uClibc is now 1.0.23, which means it no longer provides RPC support.
>    Also, we now have the fix for sys/timex.h issue, which was affecting
>    Qemu builds.

I deployed a new update of the uClibc based toolchains, with the fix
for 1.0.23. This should fix a large number of build failures caused by
a regression introduced in uClibc-ng 1.0.23.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
