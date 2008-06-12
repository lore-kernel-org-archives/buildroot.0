From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 12 Jun 2008 14:58:01 +1000
Subject: [Buildroot] Buildroot and autotools
In-Reply-To: <2590773a0806070953h7f6ee7b1v62a3ae4019b41620@mail.gmail.com>
References: <2590773a0806070953h7f6ee7b1v62a3ae4019b41620@mail.gmail.com>
Message-ID: <20080612045801.GB12527@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 07, 2008 at 12:53:27PM -0400, Christopher Taylor wrote:
> Does anyone with more experience than I with autotools know if there's
> an easy way to get autoconf to make a cross-compile configure script
> based on how my buildroot toolchain was configured (as opposed to how
> my host is configured)?

configure should be called with appropriate --target, --host and --build
switches.. configure itself is not generated for either a native or
cross-compile, it will do both.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
