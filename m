From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jun 2019 17:16:01 +0200
Subject: [Buildroot] [PATCH 0/3] Update Busybox to 1.31 and use mdev
 daemon mode
In-Reply-To: <20190620163154.7a6b743b@windsurf> (Thomas Petazzoni's message of
 "Thu, 20 Jun 2019 16:31:54 +0200")
References: <20190619164257.183607-1-titouan.christophe@railnova.eu>
 <20190620163154.7a6b743b@windsurf>
Message-ID: <87a7ecffta.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed, 19 Jun 2019 18:42:54 +0200
 > Titouan Christophe <titouan.christophe@railnova.eu> wrote:

 >> Titouan Christophe (3):
 >> package/busybox: bump version to 1.31.0
 >> package/busybox: convert S10mdev to the canonical init script format
 >> package/busybox: run mdev in daemon mode

 > Series applied. Thanks!

Yes, thanks. We still need to force CONFIG_NET=y in the Linux kernel if
mdev is enabled, right?

-- 
Bye, Peter Korsgaard
