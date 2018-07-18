From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 18 Jul 2018 11:10:50 -0300 (BRT)
Subject: [Buildroot] [PATCH] vim: install /bin/vi as a relative symlink
In-Reply-To: <20180718150350.4a910b0c@windsurf>
References: <20180718123443.7242-1-casantos@datacom.com.br>
 <20180718150350.4a910b0c@windsurf>
Message-ID: <617073337.4310170.1531923050413.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "DATACOM" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "Yann Morin" <yann.morin.1998@free.fr>, "ratbert90" <aduskett@gmail.com>,
> "Baruch Siach" <baruch@tkos.co.il>
> Sent: Wednesday, July 18, 2018 10:03:50 AM
> Subject: Re: [Buildroot] [PATCH] vim: install /bin/vi as a relative symlink

> Hello,
> 
> On Wed, 18 Jul 2018 09:34:43 -0300, Carlos Santos wrote:
>> Prevent creating a dangling symlink when vim is not present on the host
>> machine. With BR2_ROOTFS_MERGED_USR, just link to "vim", since they are
>> on the same directory, otherwise link to "../usr/bin/vim".
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> 
> Baruch had already sent a patch with the same title/intention, but it
> is no longer in the pending state in patchwork.
> 
> Could you clarify what happened, and which of the two patches is
> relevant ?

Baruch's patch is for busybox and is under review. Both can be applied
independently.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
