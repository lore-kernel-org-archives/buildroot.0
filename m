From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2020 08:41:23 +0200
Subject: [Buildroot] [PATCH v1 5/5] package/docker-proxy: bump to latest
 commit hash 6d6f28
In-Reply-To: <20200913001659.472814-5-christian@paral.in>
References: <20200913001659.472814-1-christian@paral.in>
 <20200913001659.472814-5-christian@paral.in>
Message-ID: <20200914084123.058b6aed@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Sat, 12 Sep 2020 17:16:58 -0700
Christian Stewart <christian@paral.in> wrote:

> docker network library has not published a release, take the latest master
> branch commit hash.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

I have not applied this patch, because it doesn't apply to master. Your
"previous" version of docker-proxy doesn't match the one we have in
master. Of course, I could have fixed up the trivial conflict myself,
but rather than blindly doing that I wanted to make sure we haven't
missed something.

Could you double check this?

Thanks !

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
