From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Thu, 17 May 2012 22:38:21 -0600
Subject: [Buildroot] connman requirement for resolver in toolchain
In-Reply-To: <20120517102649.6a6dc5ab@skate>
References: <1337223711.1915.3.camel@galileo.gfxmuse.org>
 <20120517102649.6a6dc5ab@skate>
Message-ID: <1337315901.1681.13.camel@kepler.gfxmuse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2012-05-17 at 10:26 +0200, Thomas Petazzoni wrote:
> Hello Michael,

Howdy Thomas.

> All packages in Buildroot assume that if uClibc is used, then the
> uClibc configuration contains at least the options that Buildroot uses
> to build uClibc when the internal backend is used. Those options are
> listed in toolchain/uClibc/uClibc-0.9.xx.config.

Oops. That's what I missed.  I didn't check my uClibc config.  I only
looked at Crosstool-NG's config (well, and Buildroot's).  I'll check
uClibc.

> But the overall answer is: if you're using an uClibc external
> toolchain, Buildroot can't do anything to adjust the uClibc
> configuration, so it's your job to do so :-)

Yup.  I just have to remember which ones to check.  :-)

Thanks again Thomas.

-- 
Michael J. Hammel <buildroot@graphics-muse.org>
