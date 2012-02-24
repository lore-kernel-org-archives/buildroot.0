From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 24 Feb 2012 10:10:22 +0100
Subject: [Buildroot] BR 2012 & pandaboard :: BOOT issue
In-Reply-To: <CAPEB33y3AJkE7xQPEGYRpx5G2hXz7SZgd_nCHy+Zd8oQQm-yRg@mail.gmail.com>
References: <CAPEB33zmLTp+95wimobRGVi+Ze4t_7ikSc44goGUpbmmqYZ6Bw@mail.gmail.com>
 <4F473C51.2050500@visionsystems.de>
 <CAPEB33y3AJkE7xQPEGYRpx5G2hXz7SZgd_nCHy+Zd8oQQm-yRg@mail.gmail.com>
Message-ID: <CAGm1_kuo0GkbKRYs2_mK_hzjgeVC1o6MFKaToFnWHhk4ofs0gQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 24, 2012 at 9:43 AM, MERCADIER Johann
<johann.mercadier@imerir.com> wrote:
> Here are some infos on my toolchain built using BR, I didn't not find much
> difference with yours Yegor but for the newbie I am, I probably miss
> something?...
>
> I will try to compile uboot on its own without using BR and see if the
> things get better?
> If you have any other ideaS I will be please to read them!

Just try ct-ng toolchain (BR2_TOOLCHAIN_CTNG) with default settings
and let us know if it helped.

Yegor
