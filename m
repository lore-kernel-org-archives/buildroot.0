From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:36:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to v6.2.1
In-Reply-To: <20210308110939.242728-1-titouanchristophe@gmail.com>
References: <20210308110939.242728-1-titouanchristophe@gmail.com>
Message-ID: <20210314233620.6f96ef2a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Mar 2021 12:09:39 +0100
Titouan Christophe <titouanchristophe@gmail.com> wrote:

> From the release notes:
> Introduction to the Redis 6.2 release
> =====================================
> 
> This release is the first significant Redis release managed by the core team
> under the new project governance model.
> 
> Redis 6.2 includes many new commands and improvements, but no big features. It
> mainly makes Redis more complete and addresses issues that have been requested
> by many users frequently or for a long time.
> =====================================
> 
> See https://github.com/redis/redis/blob/6.2/00-RELEASENOTES
> 
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
