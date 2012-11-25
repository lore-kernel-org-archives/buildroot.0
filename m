From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Nov 2012 23:31:24 +0100
Subject: [Buildroot] [PATCH 2/2] manual: autogenerate *-list.txt
In-Reply-To: <1353544211-9308-2-git-send-email-s.martin49@gmail.com>
References: <1353544211-9308-1-git-send-email-s.martin49@gmail.com>
 <1353544211-9308-2-git-send-email-s.martin49@gmail.com>
Message-ID: <50B29C3C.5090702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/12 01:30, Samuel Martin wrote:
> I wonder whether the deprecated-list.txt file should be kept under
> scm; here I've just removed it and auto-generate it whenever the
> manual is built.
>
> It works well because the python script does not miss anything... so far.
>
> However, at the end, manual checking is still recommended.
>
> OTOH, keeping the deprecated-list.txt file under scm allows us to
> enforce synchronization between marking something as deprecated and
> the update of this list.

  I think these things should be kept under SCM.  Not just because manual
checking is recommended, but also because I don't like writing anything outside
the output directory.  Some people may have the buildroot tree in a shared,
readonly location.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
