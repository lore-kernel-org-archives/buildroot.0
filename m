From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Apr 2021 22:55:33 +0200
Subject: [Buildroot] [PATCH] package/python-falcon: Bump to version 3.0.0
In-Reply-To: <20210406160605.264867-1-grzegorz@blach.pl>
References: <20210406160605.264867-1-grzegorz@blach.pl>
Message-ID: <20210420225533.24d5b6a0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  6 Apr 2021 18:06:04 +0200
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Depends on BR2_PACKAGE_PYTHON3
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  package/python-falcon/Config.in          | 1 +
>  package/python-falcon/python-falcon.hash | 6 +++---
>  package/python-falcon/python-falcon.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)

You had forgotten to explain why the license file hash had changed. I
verified why, updated the commit log, and applied. Thanks a lot for
your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
