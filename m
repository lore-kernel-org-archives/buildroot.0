From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Apr 2017 21:24:54 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2017.03-rc1
In-Reply-To: <1492801246-21302-1-git-send-email-vzakhar@synopsys.com>
References: <1492801246-21302-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20170421212454.4902a436@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Apr 2017 22:00:46 +0300, Vlad Zakharov wrote:
> This commit bumps ARC toolchain to arc-2017.03-rc1
> 
> Please note that it is a release candidate and it might contain some
> breakages, please don't use it for production builds.
> 
> Also I have updated pathces for binutils as our auto-generated files in

Typo: patches

> binutils differ comparing to 2.28.

I am not sure what you mean here. What is "auto-generated" here ?


> @@ -1,17 +1,18 @@
> -From d76a7549b43974fe8564971a3f40459bc495a8a7 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@gmail.com>
> -Date: Fri, 25 Dec 2015 11:40:53 +0100
> -Subject: [PATCH] ld-makefile
> +From 32078014f734430e1c68fe40aaf970b9805ecaf5 Mon Sep 17 00:00:00 2001
> +From: Vlad Zakharov <vzakhar@synopsys.com>

You should not be changing the author of the commits, so Romain Naour
should remain the author.

> +Date: Fri, 21 Apr 2017 21:19:13 +0300
> +Subject: [PATCH] [PATCH] ld-makefile

Not sure how you managed to get this "[PATCH] [PATCH]" here

> +From 4a5a8b983fb31a67f976e0dd9cf5e8580ef55098 Mon Sep 17 00:00:00 2001
> +From: Vlad Zakharov <vzakhar@synopsys.com>

Same comment.

> +Date: Fri, 21 Apr 2017 21:23:55 +0300
> +Subject: [PATCH] [PATCH] check-ldrunpath-length

Same comment.

The rest looks good to me. Could you fix the above minor issues and
send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
