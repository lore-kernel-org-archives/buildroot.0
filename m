From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Sat, 12 Sep 2009 07:41:24 -0700
Subject: [Buildroot] Configure linux kernel within buildroot
In-Reply-To: <F239D13E-838F-4CA7-9AAE-D79234BBAD0A@gmail.com>
References: <F239D13E-838F-4CA7-9AAE-D79234BBAD0A@gmail.com>
Message-ID: <4AABB314.9070507@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ben,

To build your kernel and images, simply type out    make    from your 
buildroot main folder.
To configure main buildroot settings type:    make menuconfig
To configure kernel settings type:   make linux26-menuconfig
To configure busybox type:   make busybox-menuconfig
To configure uclibc type:   make uclibc-menuconfig

Some good docs can be found here: http://buildroot.uclibc.org/buildroot.html

Best Regards,
Dan Pattison
EtherTek Circuits


Ben Coughlan wrote:
> Hi All,
>
> I'm fairly new to Buildroot and I have a sufficiently newbie question 
> to ask.
>
> How do I configure the kernel buildroot produces?  The first 'make' 
> gave me a menuconfig for the kernel but I don't know how to get it 
> back or alter the cached config.
>
> Any hints?
>
> Regards,
> Ben Coughlan
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> ------------------------------------------------------------------------
>
>
> No virus found in this incoming message.
> Checked by AVG - www.avg.com 
> Version: 8.5.409 / Virus Database: 270.13.91/2363 - Release Date: 09/11/09 09:15:00
>
>   
