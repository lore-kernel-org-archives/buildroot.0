From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Fri, 18 Dec 2009 12:11:18 +0800
Subject: [Buildroot] [buildroot] telnetd and udhcpc
In-Reply-To: <4B2CB099CF3D4F40B1B1442281CA94FFCED852@EXCHANGEVS01.appsig.com>
References: <4B2CB099CF3D4F40B1B1442281CA94FFCED852@EXCHANGEVS01.appsig.com>
Message-ID: <48ab7e010912172011u655392c9o668335be401fbe65@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> *I was looking though the configuration in buildroot, and I couldn?t find
> the option to enable the telnetd in busybox?  I tried enabling the busybox
> packages, but to no avail. :(.  I could only find info about the --- when
> using search.  Is this the package I should be using?  Could you point me to
> the right box to check?  Thanks!!!!*
>
>  You could use telnetd indiviually or together with inetd.
>
> *The second problem I am having is the udhcpc.  How do I get that to be
> run at startup?  Do I need to  directly edit the S40_network script or the
> inittab?  The build I have right now is coming up fine doing dhcp for an
> address but the resolve.conf is not being populated unless I manually run
> the udhcpc script.   I have the kernel set to have the IP: DHCP support
> enabled (CONFIG_IP_PNP_DHCP).  Should I disable this and then somehow set it
> to call the udhcpc in busybox?  *
>
>  Check out the file /etc/network/interfaces which contains network
> configuration.
>
> Thanks again.  You all have been a tremendous help!
>
>
>
> :: Ryan Neal
>
> 490/279
>
> 408-774-2747
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091218/eea9eb46/attachment.htm>
