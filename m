From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 13 Mar 2015 10:10:51 +0100 (CET)
Subject: [Buildroot] [PATCH] ARC: bump tools to 2014.12 release
In-Reply-To: <1426237234.2836.25.camel@synopsys.com>
Message-ID: <1002870381.1069734.1426237851891.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

----- Mail original -----
| De: "Alexey Brodkin" <Alexey.Brodkin@synopsys.com>
| ?: "romain naour" <romain.naour@openwide.fr>, "thomas petazzoni" <thomas.petazzoni@free-electrons.com>
| Cc: buildroot at uclibc.org
| Envoy?: Vendredi 13 Mars 2015 10:00:34
| Objet: Re: [Buildroot] [PATCH] ARC: bump tools to 2014.12 release
| 
| On Fri, 2015-03-13 at 09:19 +0100, Romain Naour wrote:
| > Hi Alexey,
| > Can you have a look at this patch:
| > https://patchwork.ozlabs.org/patch/449686/
| > 
| > The issue seem to be related to avr32 removal.
| 
| Strange enough I got everything built even from the same git snapshot
| as
| it was in autobuilder.
| 
| That means I cannot really test proposed patch - it won't fix
| anything
| for me because everything works already.
| 
| The only reason I may think of for that difference in behavior is
| host
| gcc version. I'm on 64-bit Fedora 21 with gcc 4.9.2:
|  --->8---
|  gcc version 4.9.2 20150212 (Red Hat 4.9.2-6) (GCC)
|  --->8---
| 
| Romain, Thomas what host gcc you/autobuilder use?

Same at home 64-bit Fedora 21 with gcc 4.9.2 :)
As I said in the patch comment, I can't reproduce the issue...

Best regards,
Romain
| 
| -Alexey
| 
