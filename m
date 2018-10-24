From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:24:14 +0200
Subject: [Buildroot] [PATCH 2/2] spice: security bump to version 0.14.1
In-Reply-To: <20181017094520.4187-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 17 Oct 2018 11:45:19 +0200")
References: <20181017094520.4187-1-peter@korsgaard.com>
 <20181017094520.4187-2-peter@korsgaard.com>
Message-ID: <87bm7ja5xt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2018-10873: A vulnerability was discovered in SPICE before version
 > 0.14.1 where the generated code used for demarshalling messages lacked
 > sufficient bounds checks.  A malicious client or server, after
 > authentication, could send specially crafted messages to its peer which
 > would result in a crash or, potentially, other impacts.

 > Drop patches as they are now upstream.

 > Add host-pkgconf as the configure script uses pkg-config.  Drop removed
 > --disable-automated-tests configure flag.

 > Add optional opus support, as that is now supported and needs to be
 > explicitly disabled to not use.  Explicitly disable optional gstreamer
 > support for now as the dependency tree is fairly complicated.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
