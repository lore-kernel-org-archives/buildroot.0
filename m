From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Feb 2012 21:33:05 +0100
Subject: [Buildroot] [PATCH 1 of 2 v4] Makefile.package.in: add utility
	functions find*clauses and notfirstword
In-Reply-To: <538b3f5d045480a88244.1329292981@beantl019720>
References: <patchbomb.1329292980@beantl019720>
 <538b3f5d045480a88244.1329292981@beantl019720>
Message-ID: <201202152133.05361.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 15 February 2012 09:03:01 Thomas De Schampheleire wrote:
> This patch adds a few utility functions to Makefile.package.in.
> 
> Functions finddirclauses and findfileclauses help in building a find command
> that skips a set of directories and performs operations on a set of files.
> This pattern can for example be used to keep certain files or directories from
> being stripped, or to remove certain files from a package installation.
> 
> The notfirstword function is the inverse of the 'firstword' function in make:
> it returns all but the first word.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120215/4cd4b9e3/attachment.html>
