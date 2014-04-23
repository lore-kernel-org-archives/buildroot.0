From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Apr 2014 17:35:14 +0200
Subject: [Buildroot] [Question] Are there tutorials for differnt rootfs ?
In-Reply-To: <53578C56020000460004DEA4@gwia2.rz.hs-offenburg.de>
References: <53578C56020000460004DEA4@gwia2.rz.hs-offenburg.de>
Message-ID: <5357DDB2.7080507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/04/14 09:48, Frank Ihle wrote:
> Hi Buildroot,
>  
> I was trying to switch from initramfs to different rootfs options of
> Buildroot 2013.11. Unfortunately it seems that only  Images with an
> initramfs and an already decompressed rootfs on a separate partition seem
> to work to boot my system.
>  
> Because I guess to fix this error is a far bigger thread, I just want to
> know if there are some examples or tutorials of how to use different
> rootfs. Including e.g.: what the kernel command line has to look like,
> the drivers that are used etc. - basically everything that is needed to
> run my embedded system with a specific filesystem.

 I believe there are a few examples in the documentation, but the number
of possibilities is simply too large to document. There are also a few
examples in READMEs of the supported boards. It depends quite a lot on
your target architecture and your boot medium.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
