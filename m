From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri, 14 Aug 2020 00:23:11 +0200
Subject: [Buildroot] [PATCH 7/7] support/misc/gitlab-ci.yml.in: use
 python3 for flake8
In-Reply-To: <20200812142906.598755-8-thomas.petazzoni@bootlin.com>
References: <20200812142906.598755-1-thomas.petazzoni@bootlin.com>
 <20200812142906.598755-8-thomas.petazzoni@bootlin.com>
Message-ID: <617bc67e-09f3-be85-17c4-146a3e766ce1@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 12/08/20 16:29, Thomas Petazzoni wrote:
> The pkg-stats script now uses Python3 only constructs (the "async"
> keyword) and therefore fails to pass the Python2 flake8 test.
> 
> Let's use the Python3 flake8 instead.
> 
> Fixes:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/681711009
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
