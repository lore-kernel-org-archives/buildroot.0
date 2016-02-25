From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Feb 2016 00:30:55 +0100
Subject: [Buildroot] [PATCH 1/1] Add config to nfsd to set number of
 threads
In-Reply-To: <56CF66D2.2080804@gmx.de>
References: <1450381505-3796-1-git-send-email-universeII@gmx.de>
 <20151217200424.GC3653@free.fr> <567317AE.5060006@gmx.de>
 <20151217202555.GE3653@free.fr> <56B30C5E.2020702@gmx.de>
 <20160204205004.GB3468@free.fr> <56BDA67E.8060404@gmx.de>
 <56CF66D2.2080804@gmx.de>
Message-ID: <56CF8EAF.407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/25/16 21:40, Andreas Ehmanns wrote:
> Yann,
> is the patch o.k. for you? Shall I resend it using git?

 Yes, please send using git. Patches sent as attachments have an even bigger
chance of being ignored than other patches.

 However, I can already say that it should be two separate patches: one changing
"done" to OK/FAIL, and a second one doing the functional changes.

 Regards,
 Arnout

> Please let me know.
> 
> Regards,
> Andreas
> 
> Am 12.02.2016 um 10:31 schrieb Andreas Ehmanns:
>> Yann,
>> indeed a killall -9 worked. So I reworked the patch. According to Thomas'
>> recommendation I added the OK/FAIL output as done in the dropbox init script.
>> Please have a look at the attached patch. If it's o.k., I'll resend it using git.
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
