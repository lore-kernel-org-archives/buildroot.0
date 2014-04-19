From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 08:55:02 +0200
Subject: [Buildroot] wget autoreconfigure problem
In-Reply-To: <1899265.ckz4x4Fb2x@hyperion>
References: <1899265.ckz4x4Fb2x@hyperion>
Message-ID: <20140419085502.29a55aee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maarten ter Huurne,

On Sat, 19 Apr 2014 08:02:56 +0200, Maarten ter Huurne wrote:

> The build of wget fails with the following error message:
> 
> make[3]: Entering directory 
> `/home/mth/gcw0/buildroot/output/build/wget-1.15/po'
> *** error: gettext infrastructure mismatch: using a Makefile.in.in from 
> gettext version 0.17 but the autoconf macros are from gettext version 0.18
> make[3]: *** [check-macro-version] Error 1

This problem has been fixed by
http://git.buildroot.net/buildroot/commit/package/wget?id=f8a2497287fa8fc0afa7698c30284a7674723aa2.

Can you confirm it also fixes the problem for you?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
