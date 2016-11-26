From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Nov 2016 14:08:28 +0100
Subject: [Buildroot] problem with cups
In-Reply-To: <1480163241688-151160.post@n4.nabble.com>
References: <1480147676790-151149.post@n4.nabble.com>
 <1480163241688-151160.post@n4.nabble.com>
Message-ID: <298f3527-2510-22f2-7dda-67e6db24cfab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-11-16 13:27, Ajorian wrote:
> thanks dear Arnout, i got patch file from http://patchwork.ozlabs.org, but as
> i said i'm newbie with buildroot. what should i do with downloaded file
> (1-1-package-ghostscript-new-package.patch) ?

 Just apply to the buildroot tree. Go to the buildroot directory and type

patch -p1 -i 1-1-package-ghostscript-new-package.patch

After that, ghostscript should appear in the "Graphic libraries and
applications" menu.

 Regards,
 Arnout

> 
> 
> would you help me? 
> thank you again.
> 
> 
> 
> -----
> it seams some thing in the word is wrong!
> --
> View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/problem-with-cups-tp151149p151160.html
> Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
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
