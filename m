From: Rico Bachmann <bachmann@tofwerk.com>
Date: Mon, 30 Apr 2012 16:13:25 +0200
Subject: [Buildroot] [PATCH v3] package: add libfcgi fast cgi library.
In-Reply-To: <87obqa4c5r.fsf@macbook.be.48ers.dk>
References: <20111014110808.70e495a8@skate>	<1318583794-9897-1-git-send-email-arnout@mind.be>
 <87obqa4c5r.fsf@macbook.be.48ers.dk>
Message-ID: <000f01cd26db$69039c30$3b0ad490$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi together

I was using gcc 4.3.X until now... Today I changed to gcc 4.5.3
I had some problems while building libfcgi with gcc 4.5.3!
There was an error: EOF is undefined.

This issue is already known on the libfcgi mailinglist:
http://article.gmane.org/gmane.comp.web.fastcgi.devel/3205/match=eof

I will add this patch to buildroot asap.

Is there in BR a nice possibility to use a patch from a package only
when gcc >=4.4.X?

And how do I have to handle the patch because its written by Markus from
the libfcgi mailing list and not by myself?

Regards Rico

> -----Urspr?ngliche Nachricht-----
> Von: Peter Korsgaard [mailto:jacmet at gmail.com] Im Auftrag von Peter
> Korsgaard
> Gesendet: Sonntag, 29. April 2012 20:38
> An: Arnout Vandecappelle (Essensium/Mind)
> Cc: buildroot at busybox.net; Rico Bachmann
> Betreff: Re: [PATCH v3] package: add libfcgi fast cgi library.
> 
> >>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind)
> <arnout@mind.be> writes:
> 
>  Arnout> From: Rico Bachmann <bachmann@tofwerk.com>  Arnout> Signed-
> off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>  Arnout>
> Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
> 
> Committed, thanks both.
> 
> --
> Bye, Peter Korsgaard

Mit freundlichen Gr?ssen

Tofwerk AG, Rico Bachmann

+41 33 511 11 69
bachmann at tofwerk.com
http://www.tofwerk.com
Uttigenstrasse 22
CH - 3600 Thun
