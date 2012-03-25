From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Mar 2012 23:50:07 +0200
Subject: [Buildroot] [PATCH 00/11] RFC: Manual content reorganization
In-Reply-To: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
References: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
Message-ID: <201203252350.08283.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 21 March 2012 00:09:50 Samuel MARTIN wrote:
> Right now, I'm not happy with everything I did.
> For example, now I use a deeper toc (4 title levels in this patch set vs. 3 on
> the current git master). This has a side effect on the html manual, indeed the
> toc only shows the first two level, this reduce the readability, IOW the fact
> that one can quickly find the relevant piece of information he/she is looking
> for.

 I don't think it reduces readability.  The table of contents is much 
clearer than it was before and more levels would just add clutter.  The
lack of hyperlinks to levels 3 and 4 also doesn't hurt because the
deepest levels are pretty short.  As you can see in the PDF: all level-2
sections fit on two pages, except for "Adding new packages to Buildroot".


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
