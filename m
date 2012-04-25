From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Apr 2012 19:35:26 +0200
Subject: [Buildroot] [PATCH v2] xf86-input-vmmouse: Make
 xf86-input-vmmouse available only to x86/x86_64 architectures
In-Reply-To: <1335368942-20039-1-git-send-email-markos.chandras@imgtec.com>
References: <1335368942-20039-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <20120425193526.470f6a02@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Apr 2012 16:49:02 +0100,
Markos Chandras <markos.chandras@imgtec.com> a ?crit :

> The xf86-input-vmmouse source code fails to compile intentionally on any
> architecture but x86/x86_64. The following error is printed when compiling for a
> different architecture:
> 
> vmmouse_proto.h:62:2: error: #error The vmmouse protocol is only supported on
> x86 architectures.
> vmmouse_proto.c:117:2: error: #error "VMMouse is only supported on x86 and
> x86-64.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
