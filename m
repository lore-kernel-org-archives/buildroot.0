From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Fri, 31 Aug 2007 17:05:19 +0200
Subject: [Buildroot] [buildroot 0001480]: mpfr site path changed
In-Reply-To: <8e1b2f8540b63b8784b571488b1b0cd2@busybox.net>
References: <8e1b2f8540b63b8784b571488b1b0cd2@busybox.net>
Message-ID: <46D82E2F.2050701@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bugs at busybox.net wrote:

<cut bug notes>

> ---------------------------------------------------------------------- 
>  bernhardf - 08-31-07 08:07  
> ---------------------------------------------------------------------- 
> The suggested quickfix is not the proper thing to do.
> We really want the current, stable gmp and mpfr and not an old, stale
> one.

I agree bumping the version is correct, but if the patch I sent is also 
committed the user will not experience a missing mpfr when building. 
Makes buildroot a bit more robust against "sudden" changes in version 
numbers.

The package maintainer should bump the version number when there is a 
new release IMHO.

<cut history>

-- 
HC
