From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu, 20 Jun 2019 18:02:34 +0200
Subject: [Buildroot] [PATCH 0/3] Update Busybox to 1.31 and use mdev
 daemon mode
In-Reply-To: <87a7ecffta.fsf@dell.be.48ers.dk>
References: <20190619164257.183607-1-titouan.christophe@railnova.eu>
 <20190620163154.7a6b743b@windsurf> <87a7ecffta.fsf@dell.be.48ers.dk>
Message-ID: <db790277-70c6-47d5-6ea5-02444579522d@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On 6/20/19 5:16 PM, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> 
>   > On Wed, 19 Jun 2019 18:42:54 +0200
>   > Titouan Christophe <titouan.christophe@railnova.eu> wrote:
> 
>   >> Titouan Christophe (3):
>   >> package/busybox: bump version to 1.31.0
>   >> package/busybox: convert S10mdev to the canonical init script format
>   >> package/busybox: run mdev in daemon mode
> 
>   > Series applied. Thanks!
> 
> Yes, thanks. We still need to force CONFIG_NET=y in the Linux kernel if
> mdev is enabled, right?
> 

Yes, since mdev is now launched in daemon mode CONFIG_NET is now needed. 
Didn't think of enforcing that in the kernel config, I'm preparing a 
patch right now.

Regards,

Titouan
