From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 May 2012 10:32:29 +0200
Subject: [Buildroot] [PATCH] pkg-infra: remove the call from XXXTARGETS
In-Reply-To: <20120514095846.7d206d16@skate>
References: <1336857045-10679-1-git-send-email-arnout@mind.be>
 <20120514095846.7d206d16@skate>
Message-ID: <4FB0C31D.9080101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/14/12 09:58, Thomas Petazzoni wrote:
>   GENPACKAGE / HOST_GENPACKAGE
>   GENPKG / HOST_GENPKG
>   genpackage / host-genpackage
>   genpkg / host-genpkg

  +1 for any of these.

  I think it's a good idea to give functions lowercase names.  I normally don't
like long lines, but these are anyway always in a $(eval $(...)) line with nothing
else, so this is one place where it can be a long name.  Therefore I'm voting for


  autotools-package / host-autotools-package
  generic-package / host-generic-package
  cmake-package / host-cmake-package



  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
