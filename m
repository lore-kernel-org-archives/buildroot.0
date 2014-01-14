From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jan 2014 22:39:43 +0100
Subject: [Buildroot] [PATCH 0/6] [RFC] some download-related changes
In-Reply-To: <cover.1389569992.git.yann.morin.1998@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
Message-ID: <52D5AE9F.6070105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/01/14 00:44, Yann E. MORIN wrote:
> The first part, patch 1 to 3, are a fix the git download helper, which
> is currently broken in case a PKG_VERSION is a sha1 that does not exist
> in the repository.
>
> Since the make macro was a bit complex to read and maintain, Peter
> suggested it be moved to a shell script. If this change is OK, I'll
> move the other download helpers to their own shell script.

  I would actually move all of $(DOWNLOAD) into a single helper script. I 
expect that that will give you a lot of refactoring opportunities.

  But clearly that can wait for follow-up patches.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
