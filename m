From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Sep 2018 18:26:26 +0200
Subject: [Buildroot] [PATCH 1/1] bootutils: fix build with glibc 2.28
In-Reply-To: <20180929111537.22500-1-fontaine.fabrice@gmail.com>
References: <20180929111537.22500-1-fontaine.fabrice@gmail.com>
Message-ID: <169683a6-c4e0-8f28-e14f-dd98a610b63d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Le 29/09/2018 ? 13:15, Fabrice Fontaine a ?crit?:
> Replace first patch which was adding sys/types.h to fix musl issue by a
> patch adding sys/sysmacros to fix build with glibc 2.28
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c26761663a764a2eb7af54316a6dc78bd01490fb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Why we want to keep Bootutils in Buildroot?
Upstream is dead since 2009 and "BootUtils is a collection of utilities to
facilitate booting of modern Kernel 2.6 based systems"

Maybe it's time to remove this package?

Best regards,
Romain
