From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jul 2014 23:39:16 +0200
Subject: [Buildroot] [PATCH 2/6 v2] support/download: fix the git helper
In-Reply-To: <53BC2044.1040409@mind.be>
References: <cover.1404769268.git.yann.morin.1998@free.fr>
 <b0bdeb224c0dab926128a93fe7ddf31d4a3b67ac.1404769268.git.yann.morin.1998@free.fr>
 <53BC2044.1040409@mind.be>
Message-ID: <53BC6504.1030204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/07/14 18:45, Arnout Vandecappelle wrote:
>  Actually, the ls-remote step is a bit useless: a failing shallow clone will not
> be slower, and if it succeeds it wasn't necessary to begin with.

 d'Oh, silly me, that was introduced in d1f5fc29e in order to support pre-1.7.0
git versions that don't error out on a failing shallow clone. So it's not
useless at all.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
