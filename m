From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Aug 2010 12:42:37 +0200
Subject: [Buildroot] [PATCH] Bump kernel & headers to latest stable
 version
In-Reply-To: <4C63EC50.3080904@zacarias.com.ar>
References: <4C63EC50.3080904@zacarias.com.ar>
Message-ID: <20100813124237.6a917118@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Aug 2010 09:42:56 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> Bump the headers to the latest stable versions:
> 2.6.27.47 -> 50
> 2.6.32.16 -> 18
> 2.6.33.6 -> 7
> 2.6.34.1 -> 3
> 
> Bump kernel to latest stable version, 2.6.34.1 -> 3

As said on IRC, this one was missing the modifications on the SCSI
headers patch, so I've merged your next version.

FWIW, two days ago, this patch has been merged upstream:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=083c8c1e60e5c27a277e87dbeb6b89b47937559f.
So 2.6.35 should be the last kernel version on which we will suffer
this long-standing problem.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
