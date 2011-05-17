From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 17 May 2011 07:13:17 +0200
Subject: [Buildroot] adding libiqrf
In-Reply-To: <BANLkTi=zt4AaA4HZ_bXGGymeZt5=p_2CqQ@mail.gmail.com>
References: <BANLkTi=zt4AaA4HZ_bXGGymeZt5=p_2CqQ@mail.gmail.com>
Message-ID: <BANLkTinzDqT5Fy=8U3-BxBWRnnjSwrvVdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

2011/5/16 Belisko Marek <marek.belisko@gmail.com>:
> +
> +$(eval $(call GENTARGETS,package,libiqrf))
> +
>

Since it's using GNU Autotools for building, try change GENTARGETS
into AUTOTARGETS and try again.
