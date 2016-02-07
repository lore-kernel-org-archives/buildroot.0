From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:04:22 +0100
Subject: [Buildroot] [PATCH] mpd: disable for sparcv8
In-Reply-To: <20160119224338.GA16884@waldemar-brodkorb.de>
References: <20160119224338.GA16884@waldemar-brodkorb.de>
Message-ID: <20160207220422.0568f982@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 19 Jan 2016 23:43:38 +0100, Waldemar Brodkorb wrote:
> Even the main source code in mpd requires some missing
> atomic ops. So only disable some failing plugins, does not
> solve the following autobuild error:
> http://autobuild.buildroot.net/results/e2207280f3a177e12dba502b1c01f5aeb431d04c/
> 
> Leon3 works fine.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I've applied what I believe is a better solution:

  https://git.busybox.net/buildroot/commit/?id=84533029c70a4dffb2cd2e4f05e3903fd1b8fcd9

(it allows to build mpd on SPARCv8)

So I've marked your patch as rejected.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
