From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:53:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: disable docs
In-Reply-To: <20200419224009.27450-1-james.hilliard1@gmail.com>
References: <20200419224009.27450-1-james.hilliard1@gmail.com>
Message-ID: <20200420075311.04788a6b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Apr 2020 16:40:09 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We can skip building docs by only running make against subdirs that are
> not "doc".
> 
> Fixes:
> http://autobuild.buildroot.net/results/e65/e65c23c3c1cae9aa9d697323fabf8a6f310fc3ba/build-end.log
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/apcupsd/apcupsd.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
