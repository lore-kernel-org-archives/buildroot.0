From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 12 Nov 2013 21:40:12 +0000
Subject: [Buildroot] [PATCH 1/7] gdb: arc: Use git instead of website
In-Reply-To: <20131112223739.45f76af9@skate>
References: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
 <1384262780-12743-2-git-send-email-mjonker@synopsys.com>
 <20131112223739.45f76af9@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D685F1749A@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> > -	default "7.5.1-arc" if BR2_arc
> > +	default "8673f98"  if BR2_arc
> 
> Is there any reason why for gdb and binutils we don't have a "choice"
> option for the ARC version? I know it's a bit silly because for ARC that
> would be the only choice, but that would make things more similar to what we
> do for gcc, no?

I think that was decided as part of the review process back then. To be honest, I forgot to remove the choice in gcc now, so I didn't use this opportunity to make it consistent. Now that I'll make a v2 anyway, please let me know what your preference is: to choose or not to choose.

Thanks,

Mischa
