From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 22:25:57 +0100
Subject: [Buildroot] [PATCH v2] openpgm: depends on sync2/sync4
In-Reply-To: <1458155700-7383-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458155700-7383-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160316222557.209e1eb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 16 Mar 2016 16:15:00 -0300, Gustavo Zacarias wrote:
> Add dependency on BR2_TOOLCHAIN_HAS_SYNC_2/4 since it uses both
> __sync_fetch_and_add_2() and __sync_fetch_and_add_4() atomic builtins.
> Fixes:
> http://autobuild.buildroot.net/results/8f2/8f2a3571611dc9414c23808e7615f87b677557dd/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
