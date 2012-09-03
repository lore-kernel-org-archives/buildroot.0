From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 03 Sep 2012 11:01:46 +0200
Subject: [Buildroot] [PATCH 01/12] gettext: remove option to build
	statically
In-Reply-To: <1346600635-30946-2-git-send-email-yann.morin.1998@free.fr>
References: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
 <1346600635-30946-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <504471FA.3060407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/02/12 17:43, Yann E. MORIN wrote:
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> Reviewed-by: "Yann E. MORIN"<yann.morin.1998@free.fr>

  In the last BR developer meeting, we agreed not to use the Reviewed-by: tag,
but only the Acked-by: tag.  It should be used when you've reviewed the
patch and you would commit it if you had commit access.


  Another thing: it was actually Samuel Martin who initiated this patch
series.  However, the original patches were rewritten so completely by
Thomas and Maxime that it doesn't make sense to keep his Signed-off-by.
To be able to keep some of the credit, I propose to add a Cc: tag in
such a situation.


  Finally, for the whole series except 10/12 and 12/12:
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(build-test with a minimal x86 config)

  And:
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  I'm pretty much in favour of committing patches 1 to 9 now.  The first
six have had plenty of time for review, 7 and 8 are fairly obvious
bugfixes, and 9 is a mechanical rename.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
