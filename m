From: Geoff Levand <geoff@infradead.org>
Date: Tue, 10 May 2016 11:12:03 -0700
Subject: [Buildroot] [PATCH v2 1/1] package/go: bump version to 1.6.2
In-Reply-To: <1462903375.27026.55.camel@infradead.org>
References: <1462551812-8952-1-git-send-email-christian@paral.in>
 <1462903375.27026.55.camel@infradead.org>
Message-ID: <1462903923.27026.57.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2016-05-10 at 11:02 -0700, Geoff Levand wrote:
> Golang has significant improvements to support for multiarch in later
> versions. This bump is required to make many go programs functional
> under arm64, for example.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> [Also enable go language support for mips64 and mips64el (mips64le),
> which
> were added in go-1.6.2.]
> Signed-off-by: Geoff Levand <geoff@infradead.org>

Sorry I didn't see that the base patch was merged already.

I'll send out a seperate patch that just enables MIPS.

-Geoff
