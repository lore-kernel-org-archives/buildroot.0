From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 22:05:38 +0200
Subject: [Buildroot] [PATCH] package/syslog-ng: Bump to 3.32.1
In-Reply-To: <20210621081231.31335-1-judge.packham@gmail.com>
References: <20210621081231.31335-1-judge.packham@gmail.com>
Message-ID: <20210703220538.40eb4b56@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Jun 2021 20:12:31 +1200
Chris Packham <judge.packham@gmail.com> wrote:

> https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-3.32.1
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/syslog-ng/syslog-ng.hash | 2 +-
>  package/syslog-ng/syslog-ng.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I think you forgot the syslog-ng.conf update, so I did that as well,
and applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
