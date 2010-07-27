From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Tue, 27 Jul 2010 22:16:11 +0000 (GMT)
Subject: [Buildroot] buildroot and sh4
In-Reply-To: <212181.52672.qm@web23104.mail.ird.yahoo.com>
Message-ID: <297538.71443.qm@web29501.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've done a new version of the sh4 patch, you could find it her: 
http://ryu.zarb.org/~trem/buildroot/0001-Add-a-qemu-device-target-sh4-r2d.patch

I've added a sh4_defconfig in the config directory as asked by Thomas.

Philippe


--- En date de?: Sam 3.7.10, Philippe Reynes <tremyfr@yahoo.fr> a ?crit?:

De: Philippe Reynes <tremyfr@yahoo.fr>
Objet: Re: [Buildroot] buildroot and sh4
?: buildroot at busybox.net, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, "Phil Edworthy" <Phil.Edworthy@renesas.com>
Date: Samedi 3 juillet 2010, 12h52

Hi,

First, sorry for this late answer.

I've done a little patch that add a qemu device target for sh4. You could find it here : http://zarb.org/~trem/buildroot/add_qemu_sh4_r2d_target.patch

regards,
Philippe

--- En date de?: Lun 7.6.10, Phil Edworthy <Phil.Edworthy@renesas.com> a ?crit?:

De: Phil Edworthy <Phil.Edworthy@renesas.com>
Objet: RE: [Buildroot] buildroot and sh4
?: "Philippe Reynes" <tremyfr@yahoo.fr>, buildroot at busybox.net, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
Date: Lundi 7 juin 2010, 11h14




 
 






BTW, I have successfully used a
CodeSourcery external toolchain with Buildroot on sh4 (MS7724 development
board). I?m currently waiting for git access via http before creating patches
for this?  

 ? 

Phil 



 







      
-----La pi?ce jointe associ?e suit-----

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot


      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100727/6f732418/attachment-0001.html>
