From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Jun 2016 13:41:30 +0200
Subject: [Buildroot] [PATCH v2] pulseaudio: bump version to 9.0
In-Reply-To: <576D1B38.6020101@imgtec.com> (Vicente Olivert Riera's message of
 "Fri, 24 Jun 2016 12:36:24 +0100")
References: <1466677037-9608-1-git-send-email-Vincent.Riera@imgtec.com>
 <87wpleu9hv.fsf@dell.be.48ers.dk> <576D1B38.6020101@imgtec.com>
Message-ID: <87shw2u845.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Hi Peter,
 > On 24/06/16 12:11, Peter Korsgaard wrote:
 >>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
 >> 
 >> > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 >> > ---
 >> > Changes v1 -> v2:
 >> >  - hash source link updated (Thanks to Baruch Siach)
 >> 
 >> I just noticed the pulseaudio release note on lwn where it clearly
 >> states that 9.0 needs webrtc-audio-processing >= 0.2:
 >> 
 >> https://lwn.net/Articles/692424/
 >> 
 >> So I've bumped our webrtc-audio-processing package, but please take care
 >> of such issues in the future.

 > Ok, thanks.

 > By the way, care to apply this one as well?

 > http://patchwork.ozlabs.org/patch/639565/

Yes - Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
