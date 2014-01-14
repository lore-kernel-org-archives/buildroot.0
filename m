From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jan 2014 23:36:14 +0100
Subject: [Buildroot] [PATCH 2/2] package/ola: fix check for
	google.protobuf
In-Reply-To: <1389735365-20795-2-git-send-email-yann.morin.1998@free.fr>
References: <1389735365-20795-1-git-send-email-yann.morin.1998@free.fr>
 <1389735365-20795-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <52D5BBDE.4010901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/01/14 22:36, Yann E. MORIN wrote:
> From: "Yann E. MORIN"<yann.morin.1998@free.fr>
>
> Fix the google.protobuf check in an upstreamable way.
>
> As suggested by Arnout, use an autoconf ac_cv_have_* variable
> so we can pass it on the command line. This is generic behaviour
> for a lot of autoconf internals, so it makes sense to do it this
> way.
>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle<arnout@mind.be>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout
[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
