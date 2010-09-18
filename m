From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Sep 2010 19:02:16 +0200
Subject: [Buildroot] [PATCH 05/21] bison: bump to 2.4.3
In-Reply-To: <1284435648-15238-5-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
	<1284435648-15238-5-git-send-email-Martin.Banky@gmail.com>
Message-ID: <20100918190216.07a65e03@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Sep 2010 20:40:32 -0700
Martin Banky <martin.banky@gmail.com> wrote:

> + 
> + /* Get definitions of 'struct sched_param' and 'sigset_t'.
> +    But avoid namespace pollution on glibc systems.  */
> +-#ifndef __GLIBC__
> ++#if 1

Why ? This seems to contradict the comment above.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
