From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 23:41:52 +0200
Subject: [Buildroot] [PATCH 00/67] libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130727234152.2b058f4f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Mon, 15 Jul 2013 14:46:43 -0500, Spenser Gilliland wrote:
> This patch removes support for an un-threaded version of libglib2. There were
> minor cleanups and some bug fixes to various Config.in as well.
> 
> See autobuilder failures
> 
> http://autobuild.buildroot.net/results/d1fb882fe4d22a17bdd438360da515011dda2b30/build-end.log?
> http://autobuild.buildroot.net/results/b66e807769ead5caa3e3b6312e9f7c35c14eafe7/build-end.log?
> http://autobuild.buildroot.net/results/9c3fa0c5003a6369e70bfe6d611f7d745742a8c7/build-end.log?

I've committed this patch set, after squashing all the patches (except
the avahi minor cleanup patch) into one and doing a few minor fixes.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
