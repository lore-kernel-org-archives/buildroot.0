From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Jul 2016 15:44:53 +0200
Subject: [Buildroot] lshw version bump
In-Reply-To: <C039B2B452EFF24BA495644ED973419137DA1A4C@IRSMSX107.ger.corp.intel.com>
References: <C039B2B452EFF24BA495644ED973419137DA1A4C@IRSMSX107.ger.corp.intel.com>
Message-ID: <20160729154453.75c1c684@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jul 2016 09:27:02 +0000, Sokolowski, Hubert wrote:

> We were wondering if you are planning to bump a version of lshw?

We do version bumps when we receive patches that do so :-)

> We discovered that version B.02.17 (which was released in 2013) 
>  can cause segmentation fault and crash on recent hardware.
> Version B.02.18 was released this year and contains several bug fixes.
> Please apply the patch that is attached if it is acceptable for you.

Your patch looks good. Could you send it inline and no as an
attachment, by using "git send-email" ?

Another question, could you give a few more details about why you
remove all the patches? You simply indicate in the commit log that they
are "obsolete", but that's a bit short. Are they obsolete because they
have been merged upstream? Are they obsolete because the problem no
longer occurs due to other changes upstream?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
