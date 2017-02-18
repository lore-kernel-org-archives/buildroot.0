From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Feb 2017 16:16:43 +0100
Subject: [Buildroot] [PATCH 2/2] package/sunxi-mali: remove sunxi-mali
 r2p4 kernel module
In-Reply-To: <20170218150549.GF3632@free.fr>
References: <20170218145258.10213-1-romain.naour@gmail.com>
 <20170218145258.10213-2-romain.naour@gmail.com>
 <20170218150549.GF3632@free.fr>
Message-ID: <65b9e334-f4a3-cc8c-72eb-c2075dcbaf8a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

Le 18/02/2017 ? 16:05, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2017-02-18 15:52 +0100, Romain Naour spake thusly:
>> sunxi-mali r2p4 kernel module are linked against libUMP.so.2 but libump
>> package in Buildroot only provide libUMP.so.3, see [1].
> 
> OTOH, it looks like the versioning is just arbitrary:
> 
>     https://github.com/linux-sunxi/libump/commit/1c1f6337dffffe8f7aea98f710f681727ed45f4f
> 
>     We prefer version 3, as r2pX is pretty rare by now, but if needs be,
>     this can be easily changed.
> 
> So maybe libump could add a legacy symlink libUMP.so.2 -> libUMP.so.3 ?

Yes probably in this specific case but doing so is generally highly not
recommended :p
Also since r2pX was pretty rare back in 2013, I don't think it's a big loss.

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
