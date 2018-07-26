From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Jul 2018 16:12:17 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/lvm2: Fix runtime crash when
 using uclibc
In-Reply-To: <687061ac-983c-b700-615f-227b13094489@grinn-global.com>
References: <20180726131023.28695-1-m.niestroj@grinn-global.com>
 <20180726154223.390beed1@windsurf>
 <687061ac-983c-b700-615f-227b13094489@grinn-global.com>
Message-ID: <20180726161217.69057fd3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jul 2018 15:54:01 +0200, Marcin Niestroj wrote:

> I've prepared this patch to go to lvm2 upstream. I looked at other
> commits, they also included changes in 'configure' script.
> 
> I agree, that this is not necessary with Buildroot. But we have to
> choose between:
> 1) keep 'configure' changes in Buildroot lvm2 patch, so we have
>     nearly the same patch as posted upstream
> 2) remove 'configure' changes, so we make the lvm2 patch smaller
>     and cleaner.
> 
> Choice is up to you :)

Meh, why is upstream keeping the configure script under version
control ?

Anyway OK, let's use the patch that hopefully will make its way
upstream.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
