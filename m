From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Apr 2012 12:24:45 +0200
Subject: [Buildroot] [PATCH] Add new package apr-util
In-Reply-To: <1335262302-31058-1-git-send-email-bachmann@tofwerk.com>
References: <1335262302-31058-1-git-send-email-bachmann@tofwerk.com>
Message-ID: <20120424122445.0d7b604e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 24 Apr 2012 12:11:42 +0200,
Rico Bachmann <bachmann@tofwerk.com> a ?crit :

> +diff -rupN apr-util-1.4.1/configure.in apr-util-1.4.1-fix/configure.in
> +--- apr-util-1.4.1/configure.in	2009-12-17 20:15:19.000000000 +0100
> ++++ apr-util-1.4.1-fix/configure.in	2012-04-24 10:10:32.000000000 +0200

This patch lacks a header explaining what it is doing, why, and a
Signed-off-by line.

I'm also not convinced by this patch, can you detail why it is
necessary? I have the impression that by passing the right environment
variables and/or options to the configure script, you can convince it
to do the right thing, but I haven't looked into too much details about
how APU_FIND_APR is implemented.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
