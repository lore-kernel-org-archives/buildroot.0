From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 2 Jan 2015 22:38:10 +0100
Subject: [Buildroot] [PATCH v2 0/2] Portability fixes for "make
	menuconfig"
In-Reply-To: <20150102161704.GG4392@free.fr>
References: <1420145678-11134-1-git-send-email-bjorn.forsman@gmail.com>
 <20150102161704.GG4392@free.fr>
Message-ID: <CAEYzJUE3X5JpwyvZjFGCsjuBK0eNGriV8OocT0xCkJ2j_m0XbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2 January 2015 at 17:17, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Bj?rn, All,
>
> On 2015-01-01 21:54 +0100, Bj?rn Forsman spake thusly:
>> Here are two portability fixes needed to be able to run "make menuconfig" on
>> NixOS[1].
>>
>> [1]: http://nixos.org/
>>
>> Bj?rn Forsman (2):
>>   kconfig/lxdialog: get ncurses CFLAGS with pkg-config
>>   Makefile: pass host PKG_CONFIG_PATH at "make menuconfig" time
>
> I think the order should be the other way around, because you need the
> latter for the former to work.

In my opinion, both orders are equally correct. But I'll change it for you :-)

- Bj?rn
