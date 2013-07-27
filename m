From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 15:47:10 +0200
Subject: [Buildroot] [PATCH] uclibc: arc: fix fstat for big-endian
In-Reply-To: <1374596888-25427-1-git-send-email-mjonker@synopsys.com>
References: <1374596888-25427-1-git-send-email-mjonker@synopsys.com>
Message-ID: <20130727154710.57e98d27@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Tue, 23 Jul 2013 18:28:08 +0200, Mischa Jonker wrote:
> Fixes "Value too large for defined data type" messages caused by fstat
> syscall wrapper returning -EOVERFLOW.
> 
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>

Committed, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
