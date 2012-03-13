From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Mar 2012 00:44:55 +0100
Subject: [Buildroot] Buildroot] Status of valgrind on powerpc
In-Reply-To: <1331489806.73314.YahooMailNeo@web122303.mail.ne1.yahoo.com>
References: <1331489806.73314.YahooMailNeo@web122303.mail.ne1.yahoo.com>
Message-ID: <201203140044.56336.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 11 March 2012 19:16:46 Kristen Eisenberg wrote:
> It would be good to identify whether Valgrind can be built with
> uClibc with additional configuration options, or if glibc/eglibc is
> really needed. In the former case, additional documentation in the
> Config.in help would be good. In the latter case, some additional
> "depends on" to hide valgrind when uClibc is used would be nice.

 I never noticed there was something wrong with valgrind on uClibc.  I've 
been using valgrind on an x86 uClibc buildroot system without problems.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
