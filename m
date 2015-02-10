From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 10 Feb 2015 22:59:35 +0100
Subject: [Buildroot] getting X running
In-Reply-To: <XnsA43DB7FEFEB42berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <C860A811EEF34E4793E67D45FD390387@JohanW7>
 <XnsA43DB7FEFEB42berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <455E5DD938E3483BB9C2E4DC9C85E122@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


-----Oorspronkelijk bericht-----
Van: buildroot [mailto:buildroot-bounces at busybox.net] Namens Bernd Kuhls
Verzonden: dinsdag 10 februari 2015 18:05
Aan: buildroot at uclibc.org
Onderwerp: Re: [Buildroot] getting X running

Hi,

"Sagaert Johan" <sagaert.johan@skynet.be> wrote in news:C860A811EEF34E4793E67D45FD390387 at JohanW7:

> Not sure if X11 can run with uclibc,

yes, it is possible, I am using Kodi on an uClibc-based system.

> (EE) Server is already active for display 0

Did you start Xorg twice?

> [2048840.049] Current Operating System: Linux apex_systems 3.16.0 #1 
> SMP
PREEMPT Tue Feb 10 05:36:20 CET 2015 armv7l

Please tell us a bit about the buildroot defconfig used and the machine you want to run Xorg on.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot


-----------------------------------------------------------------------------------------------------------------------------------

Dear Bernd

Thanks for the reply,

The target is an imx6dl, to be exact a karo tx6dl module  with kernel 3.16.0 from their git repo.

I am not sore if I need to export anything else than DISPLAY=0.0
(Or if I am missing some .conf files in the /etc directory )

My framebuffer is ok (/dev/fb0), I can run the directfb demo's.

Best Regards, Johan



-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 77229 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150210/19a7b117/attachment.wsdl>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 6253 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150210/19a7b117/attachment.bin>
