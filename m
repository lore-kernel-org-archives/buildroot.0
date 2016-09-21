From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 12:36:21 +0200
Subject: [Buildroot] [PATCH 1/1] configs: new defconfig for TI am335x-evm
In-Reply-To: <20160921121803.487035d8@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 21 Sep 2016 12:18:03 +0200")
References: <1471261882-5640-1-git-send-email-lothar.felten@gmail.com>
 <20160918193045.15a33be3@free-electrons.com>
 <87fuotya3r.fsf@dell.be.48ers.dk>
 <20160921105303.1832ad5e@free-electrons.com>
 <87bmzhy6ci.fsf@dell.be.48ers.dk>
 <20160921121803.487035d8@free-electrons.com>
Message-ID: <877fa5y1y2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 21 Sep 2016 11:01:17 +0200, Peter Korsgaard wrote:

 >> > So maybe it's easier to have separate beaglebone_defconfig (for just
 >> > the beaglebone) and am335x_evm_defconfig (for just the EVM), without
 >> > trying to have a defconfig that handles multiple boards.  
 >> 
 >> > What do you think?  
 >> 
 >> If they are not identical, then yes. Are these minor differences
 >> critical enough that it makes sense to maintain two defconfigs?

 > How would you name this common configuration then?

I would just call it beaglebone, and mention in the readme what boards
it works on.

Newcomers are much more likely to have one of the beaglebone boards than
an evm, so naming it like that imho makes sense.

-- 
Venlig hilsen,
Peter Korsgaard 
