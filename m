From: Barry Bridges <barry@disignconsultants.com>
Date: Tue, 4 Jan 2011 12:22:57 -0000
Subject: [Buildroot] Patching python to 2.7 (Thomas Petazzoni)
In-Reply-To: <mailman.5.1294142401.15574.buildroot@busybox.net>
References: <mailman.5.1294142401.15574.buildroot@busybox.net>
Message-ID: <000001cbac0a$1ebf6020$5c3e2060$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the reply Thomas,

It must be me doing something wrong. I've seen Maxime Ripards patches but
for some reason can't get them to work.

What version of BR would you recommend for the patches and is it just a
matter of adding the patches into the package/python directory?

 

 

Thanks 

 

barry

 

From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net]
On Behalf Of buildroot-request at busybox.net
Sent: 04 January 2011 12:00
To: buildroot at busybox.net
Subject: buildroot Digest, Vol 55, Issue 7

 

Send buildroot mailing list submissions to
        buildroot at busybox.net

To subscribe or unsubscribe via the World Wide Web, visit
        http://lists.busybox.net/mailman/listinfo/buildroot
or, via email, send a message with subject or body 'help' to
        buildroot-request at busybox.net

You can reach the person managing the list at
        buildroot-owner at busybox.net

When replying, please edit your Subject line so it is more specific
than "Re: Contents of buildroot digest..."


Today's Topics:

   1. Re: Patching python to 2.7 (Thomas Petazzoni)


----------------------------------------------------------------------

Message: 1
Date: Tue, 4 Jan 2011 10:01:12 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: buildroot at busybox.net
Subject: Re: [Buildroot] Patching python to 2.7
Message-ID: <20110104100112.26aed019@surf>
Content-Type: text/plain; charset=US-ASCII

Hello,

On Tue, 4 Jan 2011 08:40:33 -0000
"Barry Bridges" <barry@disignconsultants.com> wrote:

> Could anyone tell me if they have been successful in patching python to
2.7
> on buildroot.

Yes, Maxime Ripard has sent patches to the list that do this. I have
merged them in one of my branch, but I'm also taking that opportunity
to migrate Python to the package infrastructure, which is taking longer
than expected.

If you want, I can set up a git branch with just Maxime's patches which
are working.

Regards,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com


------------------------------

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

End of buildroot Digest, Vol 55, Issue 7
**************************************** 

  _____  

No virus found in this message.
Checked by AVG - www.avg.com
Version: 10.0.1191 / Virus Database: 1435/3357 - Release Date: 01/03/11

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110104/6b01307e/attachment.html>
