From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 8 Jul 2014 10:04:06 -0400 (EDT)
Subject: [Buildroot] [PATCH v2] configs: add defconfig for TS-5x00 SBCs
In-Reply-To: <87tx6sxdai.fsf@dell.be.48ers.dk>
Message-ID: <139363858.36511.1404828246906.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

>  > +Signed-off-by: Vivien Didelot
>  > <vivien.didelot@savoirfairelinux.com>
> 
> Has this been sent upstream? I don't see it in linux-next.

Not yet, I'm actually writing an RFC to discuss about the driver
naming ("ts5500" vs. "ts5x00"). Should I remove it in the meantime?

>  > +Technologic Systems TS-5x00 serie of x86-based Single Board
>  > Computers.
> 
> I've stripped a bunch of trailing spaces here.

True, I'm using :set fo+=w in vim for .txt files,
but I understand this might be unwanted under source control.

> And added explicit
> 
> BR2_i386=y
> BR2_x86_i586=y
> 
> even though they are the current default values, for documentation /
> if we ever change the defaults.

It's better like this, indeed.

> Committed with these minor changes, thanks.

Thanks!
