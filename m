From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Aug 2012 02:39:19 +0200
Subject: [Buildroot] [PATCH] pkg-infra: warn about use of deprecated
	GENTARGETS
In-Reply-To: <1346200620-11644-1-git-send-email-arnout@mind.be>
References: <1346200620-11644-1-git-send-email-arnout@mind.be>
Message-ID: <503D64B7.1040900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/29/12 02:37, Arnout Vandecappelle (Essensium/Mind) wrote:
> With the replacement of GENTARGETS by package-generic, there is a risk
> that local packages don't work anymore without any indication of what
> is wrong.  Therefore, generate an error message if the GENTARGETS,
> AUTOTARGETS or CMAKETARGETS macro is still used.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>

  Note: this is for master, perhaps it can be left out of next.

  Note2: I only tested it with AUTOTARGETS.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
