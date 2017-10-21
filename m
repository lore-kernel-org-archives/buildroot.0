From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Oct 2017 22:56:04 +0200
Subject: [Buildroot] Implicit declaration of mblen
In-Reply-To: <1508618665952-0.post@n4.nabble.com>
References: <1508584234482-0.post@n4.nabble.com>
 <87bml0cvqq.fsf@dell.be.48ers.dk> <1508618665952-0.post@n4.nabble.com>
Message-ID: <0836e4ea-a773-fbe0-4c52-4414ad82389c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-10-17 22:44, Kees van Unen wrote:
> raspberrypi0_defconfig.raspberrypi0_defconfig
> <http://buildroot-busybox.2317881.n4.nabble.com/file/t2263/raspberrypi0_defconfig.raspberrypi0_defconfig>  

 This line looks pretty suspicious:

BR2_EXTRA_GCC_CONFIG_OPTIONS="-I/home/pi/Downloads/buildroot-2017.08/output/host/bassie"

 Maybe that causes a wrong stlib.h somewhere?

 Regards,
 Arnout

> 
> mblen_error.mblen_error
> <http://buildroot-busybox.2317881.n4.nabble.com/file/t2263/mblen_error.mblen_error>  
> 
> Hi Peter,
> 
> Thanks for your response. Uploaded defconfig en file with the error message.
> Thanks.
> 
> Bye,
> Kees
> 
> 
> 
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
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
