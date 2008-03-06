From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Thu, 06 Mar 2008 19:50:21 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/tslib
In-Reply-To: <20080306182758.09F16120295@busybox.net>
References: <20080306182758.09F16120295@busybox.net>
Message-ID: <1204829421.9461.81.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2008-03-06 at 10:27 -0800, ninevoltz at uclibc.org wrote:
> Author: ninevoltz
> Date: 2008-03-06 10:27:57 -0800 (Thu, 06 Mar 2008)
> New Revision: 21235
> 
> Log:
> patches for tslib
> 
> Added:
>    trunk/buildroot/package/tslib/tslib-1.0-absbit.patch
>    trunk/buildroot/package/tslib/tslib-1.0-remove-return-on-error-from-check-df.patch

These two patches are actually wrong, I think the tslib error you (I)
see is because of big-endian architecture. I will hopefully give it a go
next week. As long as I remember it (-:

<cut patches>

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
