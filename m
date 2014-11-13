From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Nov 2014 21:20:16 +0100
Subject: [Buildroot] [PATCH 2/2] qt: Disable Webkit Module for old Linux
 threads
In-Reply-To: <1415897355-62758-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1415897355-62758-1-git-send-email-Vincent.Riera@imgtec.com>
 <1415897355-62758-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141113212016.69c7914c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 13 Nov 2014 16:49:15 +0000, Vicente Olivert Riera wrote:

> +	depends on !BR2_PTHREADS_OLD # needs pthread_getattr_np()

Same deal, please use BR2_TOOLCHAIN_HAS_THREADS_NPTL.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
