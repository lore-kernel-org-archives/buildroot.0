From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 22:55:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: always depend on
 threads
In-Reply-To: <20200422064942.77442-1-james.hilliard1@gmail.com>
References: <20200422064942.77442-1-james.hilliard1@gmail.com>
Message-ID: <20200423225533.54961b16@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Apr 2020 00:49:42 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/aa2ad7bdb37da611a4ec863ed2e986f34ea5228b/build-end.log
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I've applied, but I've kept the thread dependencies on the USB related
options. Even though, they are redundant, we like to keep them to be
fully consistent in how we propagate "depends on".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
