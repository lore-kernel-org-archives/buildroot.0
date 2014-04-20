From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 23:49:01 +0200
Subject: [Buildroot] [PATCH] e2tools: new package
In-Reply-To: <1385661764-14355-1-git-send-email-daniel.nystrom@timeterminal.se>
References: <1385661764-14355-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <20140420234901.64d361b5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel Nystr?m,

On Thu, 28 Nov 2013 19:02:44 +0100, Daniel Nystr?m wrote:
> E2tools is a simple set of GPL'ed utilities to read, write, and
> manipulate files in an ext2/ext3 filesystem.  These utilities access a
> filesystem directly using the ext2fs library.
> 
> Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
> ---
>  package/Config.in          |  1 +
>  package/e2tools/Config.in  | 10 ++++++++++
>  package/e2tools/e2tools.mk | 16 ++++++++++++++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 package/e2tools/Config.in
>  create mode 100644 package/e2tools/e2tools.mk

Thanks, I've applied your patch, after taking into account the comments
made during the review: propagation of toolchain dependencies, usage of
a full Git hash, usage of the github helper, addition of the host
variant.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
