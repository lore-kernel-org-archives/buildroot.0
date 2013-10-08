From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Oct 2013 09:15:46 +0200
Subject: [Buildroot] [PATCH 2/2] stress: add license information
In-Reply-To: <1381200417.18302.3.camel@phoenix>
References: <1381200229.18302.0.camel@phoenix>
 <1381200417.18302.3.camel@phoenix>
Message-ID: <20131008091546.69d58892@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Tue, 08 Oct 2013 10:46:57 +0800, Axel Lin wrote:
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  package/stress/stress.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/stress/stress.mk b/package/stress/stress.mk
> index 6e82b50..387166d 100644
> --- a/package/stress/stress.mk
> +++ b/package/stress/stress.mk
> @@ -6,6 +6,8 @@
>  
>  STRESS_VERSION = 1.0.4
>  STRESS_SITE = http://people.seas.harvard.edu/~apw/stress
> +STRESS_LICENSE = GPLv3+
> +STRESS_LICENSE_FILES = COPYING

Hum, the situation is a bit weird:

 * The homepage of the project states " It is written in C, and is free
   software licensed under the GPLv2."

 * The tarball contains a COPYING file which is a copy of the GPLv3.

 * The source code itself contains the mention:

     This program is free software; you can redistribute it and/or
     modify it under the terms of the GNU General Public License as
     published by the Free Software Foundation; either version 2 of the
     License, or (at your option) any later version.

So in the end, it's hard to decide whether it's GPLv2+ or GPLv3+. Maybe
you could contact the author of 'stress' and clarify the situation?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
