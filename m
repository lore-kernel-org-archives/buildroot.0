From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Jul 2015 17:26:20 +0200
Subject: [Buildroot] [Bug 8206] mplayer uses host xorg development files
In-Reply-To: <1436625379066-105305.post@n4.nabble.com>
References: <bug-8206-163@https.bugs.busybox.net/>
 <20150707210059.917A78015E@busybox.osuosl.org>
 <1436622071664-105281.post@n4.nabble.com> <55A12A5E.4010900@mind.be>
 <1436625379066-105305.post@n4.nabble.com>
Message-ID: <55A1359C.5020109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/15 16:36, glscantlen wrote:
> Thanks Arnout,
> 
> That is essentially what I've done.
> My initial thinking was the patch got copied into the tree somewhere, then
> re-build.
> But that is not the case , as your reply suggests.

 So that doesn't solve the issue then?

 Well, looking at the patch, it can't fix the issue because a 'make
mplayer-dirclean; make mplayer' run wouldn't change anything that this patch does...

 Back to Bernd :-)

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
