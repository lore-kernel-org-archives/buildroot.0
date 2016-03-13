From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Mar 2016 21:17:35 +0100
Subject: [Buildroot] [PATCH] slang: make install-static do
	install-pkgconfig
In-Reply-To: <87mvq2gmo4.fsf@dell.be.48ers.dk>
References: <1457838391-19605-1-git-send-email-jcmvbkbc@gmail.com>
 <87mvq2gmo4.fsf@dell.be.48ers.dk>
Message-ID: <20160313211735.5c682f81@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Sun, 13 Mar 2016 21:14:51 +0100, Peter Korsgaard wrote:

> Patch description and signed-off-by missing. Alternatively we can drop
> the patch and just pass install-pkgconfig to the 'make install' step as
> we already need to use a custom make target anyway.

This is *exactly* what Max was doing in its first iteration of the
patch, to which Yann replied:

"""
Could you instead fix the
0002-Enable-a-statically-linked-version-of-slsh patch to have
install-static also depend on install-pkgconfig, please?
"""

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
