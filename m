From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Jan 2016 09:59:02 +0100
Subject: [Buildroot] could not read symbols: Bad value error on musl
 based buildroot env on rpi2 config.
In-Reply-To: <569C84F2.1050309@scalemp.com>
References: <569BB682.4000707@scalemp.com> <569BFB04.4050000@mind.be>
 <569C84F2.1050309@scalemp.com>
Message-ID: <569CA956.2050103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Please don't top-post, but reply in-line like I do below.]

On 18-01-16 07:23, Eial Czerwacki wrote:
> Greetings,
> 
> the pastebin can be found at http://paste.ubuntu.com/14565509/

 Hm, no reference to /usr/local/lib there...

 First of all, can you confirm that this happened while building host-python? I
don't see what else it could be, but just to be sure.

 Then, could you try to grep in the host-python build directory for the
occurence of /usr/local/lib? It must come from somewhere...


> what makes it a bit weirder is that on my 64 bit gentoo machine (this is
> a 32 bit ubuntu 12.04 machine) it compiles well.

 I don't expect it has anything to do with that, it's just that your gentoo
machine has a python installed in /usr/local while your ubuntu machine doesn't.

 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
