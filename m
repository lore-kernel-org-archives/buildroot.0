From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 6 Mar 2014 09:15:53 +0100 (CET)
Subject: [Buildroot] Addition of packages: libvirt & qemu (target)
In-Reply-To: <5316C8CD.7010806@mind.be>
Message-ID: <14961214.10911202.1394093753263.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
>  Just out of curiosity, what is your use case for qemu on the target?
> IIRC for Yann is was just a let's-see-if-it-can-be-done hack, that's
> why
> he never pushed it anymore. I can imagine borderline buildroot uses
> which
> have lxr or docker on the target, but full-fledged qemu?
> 

I don't know if this is the original poster's use-case, but we have 
multiple customers that are asking us to help them support old (
pentium II era) software on old (win 2k) OS and the best way to do this
is to use Qemu inbetween. Qemu can easily be modified to translate calls
to ancient hardware into calls to modern hardware and this allows old
software to run unmodified.

so a buildroot/kvm/qemu/win/legacy-software stack does make sense and 
we would be glad to see it supported in buildroot.

Regards

Jeremy Rosen
