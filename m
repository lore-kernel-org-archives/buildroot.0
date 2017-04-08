From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:31:19 +0200
Subject: [Buildroot] [PATCH 2/2] beaglebone: increase size of ext4 more
 then 60MB
In-Reply-To: <20170407100323.6871-2-michael@amarulasolutions.com>
References: <20170407100323.6871-1-michael@amarulasolutions.com>
 <20170407100323.6871-2-michael@amarulasolutions.com>
Message-ID: <20170408153119.6747dc5b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Apr 2017 12:03:23 +0200, Michael Trimarchi wrote:
> This is due to the fact that we removed auto-calculation of the ext4
> filesystem size in
> https://git.buildroot.org/buildroot/commit/?id=c6bca8cef0310bc649240b451989457ce94a8358,
> and we default to 60 MB for the filesystem size, which is not enough
> for this demo
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Tested-by: Michael Trimarchi <michael@amarulasolutions.com>

This shouldn't have my Signed-off-by, but yours, it's your patch, and
you're submitting it. If you really want to credit me, you can always do
something like:

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Could you resubmit after using your Signed-off-by? Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
