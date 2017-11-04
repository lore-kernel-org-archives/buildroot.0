From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 4 Nov 2017 18:45:14 +0100
Subject: [Buildroot] Fwd: Is grub-bios-setup the way to go to make a
 bootable CF?
In-Reply-To: <CACznjzK_AA_p348WfNZ9DTBtH0c+Qv3p3su4jAFAhN8NGuXX=g@mail.gmail.com>
References: <CACznjz+wnkYCFfzYph7=N7QvS=WRznT8RHXXDTmoVeULkzDL+w@mail.gmail.com>
 <CACznjzK_AA_p348WfNZ9DTBtH0c+Qv3p3su4jAFAhN8NGuXX=g@mail.gmail.com>
Message-ID: <5b6d5829-7621-3efa-96bc-65db27ae7ef4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-11-17 22:23, Andr?s Fern?ndez wrote:
> Hello BR people.
> 
> ?
> 
> I have exactly the same problem described in this e-mail list:
> http://lists.busybox.net/pipermail/buildroot/2014-June/100652.html
> <http://lists.busybox.net/pipermail/buildroot/2014-June/100652.html>
> 
> Have these issue any solution?

 This should have been fixed by commit 8a5a57de1c8f8eec9c49b53846e23a64bf251d9d
and setting BR2_TARGET_GRUB2_BOOT_PARTITION to the correct partition. However,
the original poster never confirmed that it solved the situation for him.

 Could you explain in detail what is not working for you, and how you configured
your system?

 Regards,
 Arnout

> 
> ?
> 
> BR,
> 
> Andr?s Fern?ndez
> 
> CRC
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
