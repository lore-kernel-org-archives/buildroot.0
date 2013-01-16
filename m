From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Jan 2013 13:24:39 +0100
Subject: [Buildroot] [PATCH 2/2] proxychains-ng: copy proxychains.conf
	to target dir
In-Reply-To: <87ip6xmia1.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 16 Jan 2013 13:20:06 +0100")
References: <1358337261-13260-1-git-send-email-stefan.froberg@petroprogram.com>
 <87ip6xmia1.fsf@dell.be.48ers.dk>
Message-ID: <87ehhlmi2g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:
 Peter> Committed, thanks.

 Peter> 2 nitpicks: It's a bit confusing to number a single patch as 2/2 - v2 of
 Peter> a patch is normally called PATCHv2 or similar.

 Peter> Secondly, we try to keep lines below 80 chars, so I've wrapped the
 Peter> install line.

Ups, got sent too soon - You also sent this patch as a change relative
to the previous patch, but I haven't applied your earlier patch so you
should send it relative to trunk instead.

-- 
Bye, Peter Korsgaard
