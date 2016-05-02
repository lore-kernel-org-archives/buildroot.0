From: Geoff Levand <geoff@infradead.org>
Date: Mon, 02 May 2016 09:37:50 -0700
Subject: [Buildroot] [PATCH v3 0/3] Add go language support
In-Reply-To: <1462074238901-b9436b8a-0eb718e2-8f9a915c@mixmax.com>
References: <cover.1459798147.git.geoff@infradead.org>
 <20160421224301.6a05f711@free-electrons.com>
 <1461965160.27026.9.camel@infradead.org>
 <20160430140314.4ff30ff1@free-electrons.com>
 <1462074238901-b9436b8a-0eb718e2-8f9a915c@mixmax.com>
Message-ID: <1462207070.27026.20.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2016-05-01 at 03:43 +0000, Christian Stewart wrote:
> Indeed, the cross compiler toolchain is NOT compiled before Go. I
> think a dependency needs to be added for this.

I have the patch below that adds BR2_TOOLCHAIN_HAS_THREADS.  Is
it enough to pull in the toolchain?

-Geoff
