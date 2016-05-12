From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 15:30:05 +0200
Subject: [Buildroot] [PATCH 4/9] package/go: Add
 BR2_TOOLCHAIN_HAS_THREADS
In-Reply-To: <62cf6f9a00fe67cf999e45f7cbf4bf2e295a0fd5.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
 <62cf6f9a00fe67cf999e45f7cbf4bf2e295a0fd5.1463010771.git.geoff@infradead.org>
Message-ID: <20160512153005.29571aec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 00:08:46 +0000, Geoff Levand wrote:
> CGO needs thread support.  Fixes build errors like these:
> 
>   warning requested reentrant code, but thread support was disabled
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>

When a commit fixes some build issues reported by the autobuilders,
please add something like:

Fixes:

   http://autobuild.buildroot.net/results/0f0f5892e474bdf9145242cee836b8acc383734f/

in the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
