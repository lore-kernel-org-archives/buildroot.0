From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 4 May 2017 10:03:26 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-05-01
In-Reply-To: <20170504145816.351b3345@free-electrons.com>
References: <20170502062817.7C03E207D4@mail.free-electrons.com>
 <CAOMZO5CG_H47Xcpo=eTF+K7Rm0YMd9XTjfvzwktrYrsCKULWgA@mail.gmail.com>
 <20170504145816.351b3345@free-electrons.com>
Message-ID: <CAOMZO5BLuk8XcT9ghYsRNpq6bNOaKHcUWMrhBKNG6_d91Se+QA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 4, 2017 at 9:58 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> No, this has absolutely nothing to do with atest. Lots of other
> packages fail to build with the same reason. There is an issue between
> binutils 2.27 and elf2flt.
>
> I think we instead need to disable binutils 2.27 on !mmu, and use
> binutils 2.28.

Thanks for the clarification!
