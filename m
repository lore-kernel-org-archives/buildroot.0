From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 10 Nov 2016 15:18:30 -0200
Subject: [Buildroot] [PATCH next 1/2] olimex_imx233_olinuxino: bump
	version
In-Reply-To: <CAB0FRssnv-Acvw32ErXifMJ5Hi2WadeE7igvf0e0Bn_uaZqtHw@mail.gmail.com>
References: <1478560176-29807-1-git-send-email-francois.perrad@gadz.org>
 <CAOMZO5ATK4Fo8iQ1v3TBZ0MdXQ7rw2eNGGnQ6uP_knfuZHmBSQ@mail.gmail.com>
 <CAB0FRssnv-Acvw32ErXifMJ5Hi2WadeE7igvf0e0Bn_uaZqtHw@mail.gmail.com>
Message-ID: <CAOMZO5DXEaUyCkqhqxfFczMmmcp0d_0+cQYc3Ve=Hr2TJfWyaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 10, 2016 at 3:10 PM, Fran?ois Perrad
<francois.perrad@gadz.org> wrote:

> There are many variants of iMX233-OLinuXino board:
>   - MAXI with Ethernet 100Mb
>   - MINI without Ethernet
>   - MINI-WIFI with an additionnal module using a Realtek 8188
>   - MICRO (daughter board)
>   - NANO (daughter board)
>
> I own only a MAXI, so I cannot do test with Wifi.
> With a MAXI, the wired ethernet works fine.
> Maybe, it's time to have more than one defconfig ?

I don't think we need more defconfigs. Just enabling the Wifi related
config options in a linux fragment file should be enough.
