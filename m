From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Dec 2013 12:28:18 +0100
Subject: [Buildroot] [PATCH] toolchain: Allow ld64.so linker
In-Reply-To: <20131203222613.27002db9@kryten>
References: <20131203222613.27002db9@kryten>
Message-ID: <20131203122818.3591f3b9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Blanchard,

On Tue, 3 Dec 2013 22:26:13 +1100, Anton Blanchard wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
> 
> The glibc dynamic linkers for ppc64 and s390x are named ld64.so.*
> so modify the check_glibc test to match them.
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> Signed-off-by: Anton Blanchard <anton@samba.org>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
