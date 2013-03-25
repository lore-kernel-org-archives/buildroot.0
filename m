From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Mar 2013 08:14:24 +0100
Subject: [Buildroot] [PATCH 6/6] manual: do not track generated files
In-Reply-To: <1363983159-4357-1-git-send-email-s.martin49@gmail.com>
References: <1363983159-4357-1-git-send-email-s.martin49@gmail.com>
Message-ID: <514FF950.4080307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/03/13 21:12, Samuel Martin wrote:
> Since there is no need  to edit the generated list, we don't need
> to keep these files under git control, so:
> * remove existing lists
> * add the 3 generated lists to .gitignore

  If they are not committed, they shouldn't be in the buildroot tree. 
Instead they should move to output/docs/manual/...

  Or is asciidoc making that hard?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
