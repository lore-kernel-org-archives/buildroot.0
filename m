From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Apr 2014 10:45:33 +0200
Subject: [Buildroot] [PATCH v5 1/2] Makefile: fix coding style regarding
	the '=' sign
In-Reply-To: <1398242364-4644-2-git-send-email-fabio.porcedda@gmail.com>
References: <1398242364-4644-1-git-send-email-fabio.porcedda@gmail.com>
 <1398242364-4644-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <53577DAD.5090405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/04/14 10:39, Fabio Porcedda wrote:
> As stated in the buildroot user manual add just a single space before
> and after a '=' sign.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Confirmed that it's whitespace fixes only with
git log -p -1 --ignore-all-space


 Regards,
 Arnout

> ---
>  Makefile | 198 +++++++++++++++++++++++++++++++--------------------------------
>  1 file changed, 99 insertions(+), 99 deletions(-)
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
