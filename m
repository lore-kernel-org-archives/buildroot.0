From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Feb 2012 11:07:14 +0100
Subject: [Buildroot] [PATCH 1/7] liburcu: add patch to fix build with
 uClibc
In-Reply-To: <87ty35sip2.fsf@macbook.be.48ers.dk>
References: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
 <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
 <fef652a4afaa01890b129d278dbb0a950ca63e3e.1328366921.git.thomas.petazzoni@free-electrons.com>
 <87ty35sip2.fsf@macbook.be.48ers.dk>
Message-ID: <20120205110714.2060d735@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 05 Feb 2012 11:00:57 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> >>>>> "Thomas" == Thomas Petazzoni
> >>>>> <thomas.petazzoni@free-electrons.com> writes:
> 
>  Thomas> Under uClibc, defining _GNU_SOURCE is strictly needed to
>  Thomas> access the CPU_*() macros.
> 
> Committed, thanks. Don't forget to send patch upstream.

This is done:
http://lists.lttng.org/pipermail/lttng-dev/2012-February/017509.html

The other ones need some update, as the upstream version has evolved
compared to the version we have in Buildroot, but I intend to send
them upstream after updating the patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
