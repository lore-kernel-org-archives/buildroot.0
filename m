From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 21 Nov 2018 16:20:51 -0200 (BRST)
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-11-20
In-Reply-To: <20181121070023.D4AD220DC4@mail.bootlin.com>
References: <20181121070023.D4AD220DC4@mail.bootlin.com>
Message-ID: <73098303.3075424.1542824451507.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "DATACOM" <casantos@datacom.com.br>
> Sent: Quarta-feira, 21 de novembro de 2018 5:00:23
> Subject: [autobuild.buildroot.net] Your build results for 2018-11-20

> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2018-11-20, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Results for the 'next' branch
> =============================
> 
> Build failures related to your packages:
> 
>     powerpc |               tpm2-abrmd-2.0.3 |
>     http://autobuild.buildroot.net/results/bd9005eeb24678aa530179a80bbc99b2176f8559
>     powerpc |               tpm2-abrmd-2.0.3 |
>     http://autobuild.buildroot.net/results/feff61dcb481a94f5f030117830984c5e09727ea

Patch submitted: https://patchwork.ozlabs.org/patch/1001280/

>     sparc64 |                util-linux-2.33 |
>     http://autobuild.buildroot.net/results/44d0538332499cea691a381048562a09cda23624

This is due to a bug in util-linux v2.33 already reported on the project
mailing list.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
