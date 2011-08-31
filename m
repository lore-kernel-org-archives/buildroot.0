From: =?ISO-8859-1?Q?J=F6rg?= Rebenstorf <Joerg.Rebenstorf@GiN.de>
Date: Wed, 31 Aug 2011 07:58:33 +0200
Subject: [Buildroot] no core dumps
In-Reply-To: <20110830153423.2dce09c8@skate>
References: <1314692362.2640.144.camel@jr-ThinkCentre-A57>
 <20110830153423.2dce09c8@skate>
Message-ID: <1314770313.2303.3.camel@jr-ThinkCentre-A57>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

no, 'ELF core dumps' hasn't been activated. That you for pointing it
out.

General Setup --->
   Configure standard kernel features --->
      Enable ELF core dumps

I enabled it and now it works as expected.

Cheers,
Crayor

On Tue, 2011-08-30 at 15:34 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> Le Tue, 30 Aug 2011 10:19:22 +0200,
> J?rg Rebenstorf <Joerg.Rebenstorf@GiN.de> a ?crit :
> 
> > I am using buildroot-2009.11.
> > 
> > I'd like to know how to enable the linux core dump feature in
> > buildroot. I have written a program that intentionally makes a
> > segfault but still I get no core dump file. Is there something
> > special with buildroot here? Do I need to activate a specific build
> > option? As you can see below I already enabled core dumps with the
> > 'ulimit' command.
> 
> Do you have ELF core dumps enabled in your kernel configuration?
> 
> Regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
G.i.N. Gesellschaft f?r industrielle Netzwerke GmbH
Dipl.-Inform. J?rg Rebenstorf
Raiffeisenstr. 15
D-64347 Griesheim
Telefon: +49 6155 - 8259 - 0
Telefax: +49 6155 - 8259 - 11
E-Mail:   joerg.rebenstorf at gin.de
Internet: http://www.gin.de
Sitz: Griesheim
Registergericht: Amtsgericht Darmstadt, HRB 5068
Gerichtsstand: Darmstadt
USt.-ID-Nr. DE 111633284
WEEE-Reg.-Nr. DE 20824942
Gesch?ftsf?hrer:
Dipl.-Ing. Wolfgang Bassenauer
Dipl.-Inform. Andreas Schoenberg

IMPORTANT NOTICE:
This message is intended only for the use of the individual or entity to which it is addressed, and may contain information that is privileged, confidential and exempt from disclosure under applicable law. If the reader of this message is not the intended recipient, or the employee or agent responsible for delivering the message to the intended recipient, you are hereby notified that any dissemination, distribution or copying of this communication is strictly prohibited. If you have received this communication in error, please notify the sender immediately by email.
The above information is automatically added to this e-mail. This addition does not constitute a representation that the content of this e-mail is legally relevant and/or is intended to be legally binding upon G.i.N. mbH.
Thank you.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110831/945c27fb/attachment.asc>
