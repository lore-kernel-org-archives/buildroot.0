From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 22:39:05 +0200
Subject: [Buildroot] [PATCH] lxc: version bump to 2.0.3
In-Reply-To: <1470858192-29796-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1470858192-29796-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160810223905.41faf40a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this patch. A few questions below.

On Wed, 10 Aug 2016 14:43:12 -0500, Matt Weber wrote:
> From: Judd Meinders <judd.meinders@rockwellcollins.com>
> 
> - Removed IPv6 and werror patches as changes where
>   incorporated upsteam.
> 
> - AUTO_RECONF is kept for libseccomp conf opt purposes
>   (other packages don't explicitly comment this when
>    kconfig conditionals are used)

Could you give more details here? Also, your justification to not add a
comment on top of AUTORECONF = YES sounds bogus. If there is an
AUTORECONF = YES, then there must be a comment on top of it that
explains why.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
