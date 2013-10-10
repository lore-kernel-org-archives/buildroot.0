From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Oct 2013 09:12:14 +0200
Subject: [Buildroot] [PATCH v3] ccache: expose control interface via
 'make ccache-options'
In-Reply-To: <1381339099-3666-1-git-send-email-tjlee@ambarella.com>
References: <5253AA39.1090908@mind.be>
 <1381339099-3666-1-git-send-email-tjlee@ambarella.com>
Message-ID: <20131010091214.7396c087@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tzu-Jung Lee,

On Wed,  9 Oct 2013 10:18:19 -0700, Tzu-Jung Lee wrote:
> usage:
> 	# set cache limit size
> 	make CCACHE_OPTIONS="--max-size=5G" ccache-options
> 
> 	# zero statistics counters
> 	make CCACHE_OPTIONS="--zero-stats" ccache-options
> 
> Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
