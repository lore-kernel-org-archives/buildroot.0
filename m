From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Sep 2013 23:32:02 +0200
Subject: [Buildroot] [PATCH] uclibc: Add UCLIBC_MMU_CONFIG to
 UCLIBC_SETUP_DOT_CONFIG
In-Reply-To: <1378347859.1658.1.camel@phoenix>
References: <1378347859.1658.1.camel@phoenix>
Message-ID: <20130905233202.12ae0e26@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Thu, 05 Sep 2013 10:24:19 +0800, Axel Lin wrote:
> commit c798bec25 "uclibc: set MMU usage accordingly" defines UCLIBC_MMU_CONFIG,
> but forgot adding it to UCLIBC_SETUP_DOT_CONFIG. Fix it.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
