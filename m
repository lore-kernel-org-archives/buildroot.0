From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Mar 2012 08:09:50 +0100
Subject: [Buildroot] [PATCH v2 3/3] Add test infrastructure
In-Reply-To: <20120305103958.11ed7a70@skate>
References: <1330866196-5360-1-git-send-email-arnout@mind.be>
 <1330866196-5360-3-git-send-email-arnout@mind.be>
 <20120305103958.11ed7a70@skate>
Message-ID: <201203060809.50641.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 05 March 2012 10:39:58 Thomas Petazzoni wrote:
> Le Sun,  4 Mar 2012 14:03:16 +0100,
> "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :
> 
> > The test infrastructure is a script and a list of tests to be run.
> > Additional test configurations can be added later to the test directory.
> 
> I know Peter has some test scripts as well, and so I have. Maybe we
> should first share what we have, and see what we can factorize?

 I was hoping that this patch would spur you guys on to do exactly that :-)


> In any case, this test infrastructure discussion should really be part
> of a separate set of patches. While your first two patches can be
> merged without much discussion, this third patch really requires some
> discussion. I don't want this test infrastructure to be the thing used
> only by one person, it needs to be used and usable by others.

 Agreed.  But the third patch depends on the other two, that's why I send
it as a single series.  Peter usually does pick up individual patches from
a series so I don't see a problem with that.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
