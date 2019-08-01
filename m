From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 11:49:19 +0200
Subject: [Buildroot] [PATCH v3 3/3] support/scripts/pkg-stats: factorize
 date and commit
In-Reply-To: <20190719130630.9967-4-victor.huesca@bootlin.com>
References: <20190719130630.9967-1-victor.huesca@bootlin.com>
 <20190719130630.9967-4-victor.huesca@bootlin.com>
Message-ID: <20190801114919.52e48bda@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Victor,

On Fri, 19 Jul 2019 15:06:30 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> -def dump_gen_info(f):
> +def dump_gen_info(f, date, git_commit):

I renamed the argument git_commit to "commit", to be consistent with
what you've done in the other functions.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
