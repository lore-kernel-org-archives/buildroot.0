From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 22 Jan 2009 07:14:06 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libconfuse
In-Reply-To: <20090121204512.4928A768C5@busybox.osuosl.org>
References: <20090121204512.4928A768C5@busybox.osuosl.org>
Message-ID: <20090122071406.155456d9@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 21 Jan 2009 20:45:12 +0000 (UTC)
jacmet at uclibc.org wrote:

> Author: jacmet
> Date: 2009-01-21 20:45:10 +0000 (Wed, 21 Jan 2009)
> New Revision: 24944
> 
> Log:
> libconfuse: fix build by removing -Werror flag
> 

You know that is not fixing it ;) Source code should not generate
warnings, they are usually a sign of something bad is happening.

But I guess this is fine for now.

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
