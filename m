From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Nov 2013 18:54:04 +0100
Subject: [Buildroot] [PATCH v2] lftp: new package.
In-Reply-To: <1385384136-22652-1-git-send-email-rebillout@syscom.ch>
References: <1385384136-22652-1-git-send-email-rebillout@syscom.ch>
Message-ID: <52938EBC.5050407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Arnaud,

On 25/11/13 13:55, Arnaud R?billout wrote:
> Here comes a second version of the patch to include lftp in buildroot.
>
> Improvements from v1:
>   * Config.in
>     * Typo corrected
>   * lftp.mk
>     * LFTP_SOURCE removed
>     * LFTP_AUTORECONF set to YES
>     * POST_INSTALL_TARGET factorized a lot
>   * patches:
>     * Signed-off
>     * Patch the m4 file instead of the configure script

  Such a changelog is normally included in the patch commit message 
itself, like so:

lftp: new package

LFTP is a sophisticated ftp/http client, and a file transfer program
...

Signed-off-by: ...
---
v2:
  * Config.in: typo corrected
  * ...


  The part below --- is not included in the git history when Peter 
commits it.


  The advantage of this approach is that you can keep the history around 
when you send v3 etc. of the patch. You update the patch using 'git 
commit --amend' or 'git rebase -i', and in the commit message you add the 
history below the --- line. On your side, the part below --- *will* be 
kept in the git history, so the next time you use git send-email, 
everything will be there.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
