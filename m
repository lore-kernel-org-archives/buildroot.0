From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2011 00:33:50 +0200
Subject: [Buildroot] [PATCH 2/2] add libfcgi to buildroot
In-Reply-To: <op.v28ha3nx705kjs@rico>
References: <add libfcgi to buildroot> <201110111806.30216.arnout@mind.be>
 <op.v28ha3nx705kjs@rico>
Message-ID: <201110140033.51194.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 12 October 2011 12:12:29, Rico Bachmann wrote:
> yes the file exists in package/fcgi and has 777 rights

 Silly me, I just now saw that the package is called libfcgi, not fcgi.  So it should of course be in the package/libfcgi directory and it should be called libfcgi-....patch.

 Anyway, there's a better solution: add -lm in the LDFLAGS of the configure environment.

 I'll just send a patch with the complete libfcgi support as a follow-up of this mail.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111014/608b7d0d/attachment.html>
