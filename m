From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Aug 2019 09:33:21 +0200
Subject: [Buildroot] [PATCH] package/tinc: upgrade to 1.0.36
In-Reply-To: <20190827091636.9024-1-zgyarmati@zgyarmati.de>
References: <20190827091636.9024-1-zgyarmati@zgyarmati.de>
Message-ID: <20190830093321.268c117f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Zoltan,

On Tue, 27 Aug 2019 11:16:36 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
>  package/tinc/tinc.hash | 2 +-
>  package/tinc/tinc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

You forgot to run "make legal-info" after this bump: the hash of the
COPYING file has changed, breaking legal-info. I took care of this
(after checking what the differences were between the old and new
COPYING files), and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
