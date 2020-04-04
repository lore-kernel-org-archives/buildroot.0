From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Apr 2020 15:08:58 +0200
Subject: [Buildroot] [git commit] package/polkit: bump to version 0.116
In-Reply-To: <20200403202802.GB22325@scaer>
References: <20191208145140.33E3E8899E@busybox.osuosl.org>
 <20200402231049.12916682@windsurf.home>
 <20200403202802.GB22325@scaer>
Message-ID: <20200404150858.7d8da1c1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Apr 2020 22:28:02 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> So I see a few options here, not all exlusive to the others:
> 
>   - push our patch upstream for the next relase,
> 
>   - try and fix our patch so that it does require autorecof (not easy
>     I'm afraid)
> 
>   - make polkit a glibc-only package, and drop our patch

Another option:

 - Bundle introspection.m4 (142 lines) into the polkit patch. I've
   tested this, it works, so I've submitted a patch that implements
   this simple solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
