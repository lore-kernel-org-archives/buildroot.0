From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 12:42:54 +0100
Subject: [Buildroot] [PATCH v1 1/1] uClibc 0.9.33 : forward errno bug
 patches from uClibc 0.9.32
In-Reply-To: <1332621845-10604-2-git-send-email-sagaert.johan@skynet.be>
References: <1332621845-10604-1-git-send-email-sagaert.johan@skynet.be>
 <1332621845-10604-2-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20130324124254.2064e896@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sat, 24 Mar 2012 21:44:05 +0100, Sagaert Johan wrote:
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---

I've removed this patch from our patchwork. An updated version had been
posted in the mean time, and later reverted because it was causing
issues. I would suggest to raise the issue to upstream and get it fixed
here if needed, and then backport a proper fix in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
