From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 18:49:02 +0200
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.0j
In-Reply-To: <1336751148-28858-1-git-send-email-gustavo@zacarias.com.ar>
References: <1336751148-28858-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120817184902.61d989c0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

Le Fri, 11 May 2012 12:45:48 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> Bump to version 1.0.0j to fix CVE-2012-2333
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

At http://patchwork.ozlabs.org/patch/148560/ we have a patch that has
been sitting for a long time, which bumps the version of openssl to
1.0.1. Looking at the OpenSSL website, I see that both the 1.0.0X
versions and 1.0.1X versions are maintained. Do you know what they
mean, and whether we should stay at 1.0.0 or move to 1.0.1?

I simply would like to know what to do with this patch in our
patchwork :)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
