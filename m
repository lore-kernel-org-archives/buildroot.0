From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Nov 2014 00:24:04 +0100
Subject: [Buildroot] [PATCH] package/libunwind: link to libgcc_s,
	not libgcc
In-Reply-To: <1416144595-14637-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 16 Nov 2014 14:29:55 +0100")
References: <1416144595-14637-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87lhnad90r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Backport a fix from upstream to link against libgcc_s instead of libgcc.
 > Fixes ltrace build failures:
 >     http://autobuild.buildroot.net/results/a0c/a0c132f8cdea2c34ceff27606764a60c2853f644/
 >     http://autobuild.buildroot.net/results/67f/67fbd04d6ae187861fa1bf84d3df1877c7be6fb2/
 >     http://autobuild.buildroot.net/results/0ca/0ca564101b870e5953acb66ac832ce9e23198392/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
