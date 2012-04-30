From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Apr 2012 19:11:13 +0200
Subject: [Buildroot] [PATCH v3] package: add libfcgi fast cgi library.
In-Reply-To: <000f01cd26db$69039c30$3b0ad490$@com> (Rico Bachmann's message of
 "Mon, 30 Apr 2012 16:13:25 +0200")
References: <20111014110808.70e495a8@skate>
 <1318583794-9897-1-git-send-email-arnout@mind.be>
 <87obqa4c5r.fsf@macbook.be.48ers.dk>
 <000f01cd26db$69039c30$3b0ad490$@com>
Message-ID: <87sjfl2lhq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rico" == Rico Bachmann <bachmann@tofwerk.com> writes:

 Rico> Hi together
 Rico> I was using gcc 4.3.X until now... Today I changed to gcc 4.5.3
 Rico> I had some problems while building libfcgi with gcc 4.5.3!
 Rico> There was an error: EOF is undefined.

Ahh, yes - I only tested with a precompiled 4.3.x toolchain.

 Rico> This issue is already known on the libfcgi mailinglist:
 Rico> http://article.gmane.org/gmane.comp.web.fastcgi.devel/3205/match=eof

 Rico> I will add this patch to buildroot asap.

 Rico> Is there in BR a nice possibility to use a patch from a package only
 Rico> when gcc >=4.4.X?

No, but there's no reason to not add it for older toolchains as well.

 Rico> And how do I have to handle the patch because its written by
 Rico> Markus from the libfcgi mailing list and not by myself?

Keep his authorship (git-style patch has this in the header), but with
your signed-off-by.

-- 
Bye, Peter Korsgaard
