From: Santhosh Ramani <srcoolz@gmail.com>
Date: Mon, 19 Jan 2015 17:40:16 -0600
Subject: [Buildroot] NFS boot
In-Reply-To: <20150116222247.77a1c18a@free-electrons.com>
References: <CADKZYYKc9a-2MNu_iS9XUvrh8FPnKQatZbbB4PidvOLVNKgd1g@mail.gmail.com>
 <20150116222247.77a1c18a@free-electrons.com>
Message-ID: <CADKZYYJxN5Epg9jaCnVnbHfk1=s6MwY2zPwAAQLVv_=iNJqVyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I apologize for the delay in replying back to you. The contents of the
/etc/network/interfaces file are:

*# Configure Loopback*
*auto lo*
*iface lo inet loopback*

*# The primary network interface - use DHCP to find our address*
*auto eth0*
*iface eth0 inet dhcp*

I would like to add that I followed this link -
http://cchia-cwp.blogspot.com/2010/05/running-buildroot-system.html to
modify the default interfaces file.

Thank you for your help.
Regards

Santhosh



On 16 January 2015 at 15:22, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Santhosh Ramani,
>
> On Fri, 16 Jan 2015 11:48:08 -0600, Santhosh Ramani wrote:
>
> > Later I changed the S40network script on the NFS file system to not start
> > the network if it's NFS mount and then it worked. S40network is a
> buildroot
> > generated script - am I missing something in the config that will
> generate
> > the correct S40network script to allow NFS mount as well.
>
> What is the contents of your /etc/network/interfaces file?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150119/677a0b06/attachment.html>
