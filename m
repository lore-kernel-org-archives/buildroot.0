From: Xianghua Xiao <xiaoxianghua@gmail.com>
Date: Tue, 26 Apr 2011 22:55:16 -0500
Subject: [Buildroot] devmem2
In-Reply-To: <129278.98526.qm@web161414.mail.bf1.yahoo.com>
References: <1303869098.2489.67.camel@kenm-i7>
	<129278.98526.qm@web161414.mail.bf1.yahoo.com>
Message-ID: <BANLkTinUVfnoMGL2jySY4h7XOpN=Gkc2dA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

why not keep devmem2 as an option but disable it by default, it's tiny
anyway and essential for embedded devel.

or maybe one day buildroot can 'opkg install devmem2' at devel/bringup
time and remove it when things are done.

Xianghua

On Tue, Apr 26, 2011 at 9:15 PM, David Anders <dave123_aml@yahoo.com> wrote:
> Peter,
>
> --- On Tue, 4/26/11, Ken McGuire <kenm@desertweyr.com> wrote:
>
>> From: Ken McGuire <kenm@desertweyr.com>
>> Subject: Re: [Buildroot] devmem2
>> To: buildroot at busybox.net
>> Date: Tuesday, April 26, 2011, 8:51 PM
>> I use devmem/devmem2 on a daily
>> basis.
>>
>
>> That's my opinion, maybe the right thing to do is just
>> remove devmem
>> from busybox, even devmem2 from the Buildroot "distro". I
>> can live with
>> building it myself.
>>
>>
>
> i agree, just remove the devmem applet from busybox and the devmem2 from buildroot.
>
> problem solved.
>
> Dave
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
