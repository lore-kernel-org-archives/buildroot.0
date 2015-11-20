From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Nov 2015 23:48:43 +0100
Subject: [Buildroot] [buildroot]Is there anyplan to add qt3d package
In-Reply-To: <CAAH=mgNfvyqVtoLER9EwPYO=8E+uMqKUBnDNGkJGF3-fGQizjQ@mail.gmail.com>
References: <CAAH=mgNfvyqVtoLER9EwPYO=8E+uMqKUBnDNGkJGF3-fGQizjQ@mail.gmail.com>
Message-ID: <564FA34B.4060907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-11-15 06:51, Jordon Wu wrote:
> Hi,
> 
> I using buildroot master branch to build qt5, but not found qt3d submodule. Is
> there any plan to add qt3d module to buildroot?

 It will be included if someone offers a patch :-) But qt3d is pretty simple,
I'm sure you will be able to create a package for it based on e.g. qt5svg. The
most difficult part is finding out the license, but fortunately, for qt3d that's
very simple too: it is LGPLv3 or GPLv2+.

 Regards,
 Arnout

> 
> Best Regards
> Jordon Wu
> =====================
> Email: jordon.wu at gmail.com <mailto:jordon.wu@gmail.com>
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
