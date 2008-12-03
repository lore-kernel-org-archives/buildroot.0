From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 03 Dec 2008 14:43:37 +0100
Subject: [Buildroot] start compiling autoconf for the host as well (was:
 svn commit: trunk/buildroot/package/autoconf)
In-Reply-To: <20081203133645.EBECF3C83E@busybox.net>
References: <20081203133645.EBECF3C83E@busybox.net>
Message-ID: <49368D09.6060703@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tpetazzoni at uclibc.org wrote:
> Author: tpetazzoni
> Date: 2008-12-03 05:36:45 -0800 (Wed, 03 Dec 2008)
> New Revision: 24242
> 
> Log:
> Fix comment about autoconf configuration/compilation/installation for
> the target (and not the host).
> 

off-topic: perhaps we should consider building autoconf, libtools, etc. 
which now quite heavily depend on when cross-compiling. I.e. not all 
distributions ship 2.13 and 2.61. AFAIK Gentoo uses 2.63.

-- 
Best regards,
Hans-Christian Egtvedt
