From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Jun 2021 22:32:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/udisks: bump to version 2.92
In-Reply-To: <20210520000905.3544040-2-giulio.benetti@benettiengineering.com>
References: <99074531-f77a-1e83-0acb-7fbf45c0e07c@benettiengineering.com>
 <20210520000905.3544040-1-giulio.benetti@benettiengineering.com>
 <20210520000905.3544040-2-giulio.benetti@benettiengineering.com>
Message-ID: <c0e288b9-5a8c-4fff-afc4-965904979b00@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/05/2021 02:09, Giulio Benetti wrote:
> Bump version to 2.92 by:
> - removing local patches that have been upstreamed
> - adding BR2_TOOLCHAIN_HAS_SYNC_4 dependency
> - adding libblockdev dependencies
> - adding libmount(contained in util-linux package) dependency
> - moving download site to github since it's the new upstream address
> - disabling all useless udisks's build option to shrink its size and t
>   use it as a daemon
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>


 Applied to next, thanks.

 Regards,
 Arnout
