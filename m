From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 02 Apr 2015 23:41:43 +0200
Subject: [Buildroot] [PATCH 4/7 v4] support/download: return different
 exit codes for different failures
In-Reply-To: <404de8633ddc3c6120c89ef457413ad9c5fd6a2d.1427840060.git.yann.morin.1998@free.fr>
References: <cover.1427840060.git.yann.morin.1998@free.fr>
 <404de8633ddc3c6120c89ef457413ad9c5fd6a2d.1427840060.git.yann.morin.1998@free.fr>
Message-ID: <551DB797.3060300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/04/15 00:15, Yann E. MORIN wrote:
> Return different exit codes depending on the error that occured:
> 
>   0: no error (hash file missing, or all hashes match)
>   1: unknown option
>   2: hash file exists, but at least one hash in error
>   3: hash file exists, but no hash for file to check
>   4: hash file exists, but at least one hash type unknown
> 
> This will be used in a later patch to decide whether the downloaded file
> should be kept or removed.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

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
