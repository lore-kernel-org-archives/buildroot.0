From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Nov 2014 14:12:05 +0100
Subject: [Buildroot] [PATCH v4 2/2] elfutils: bump version to 0.160
In-Reply-To: <1415706464-15288-3-git-send-email-Vincent.Riera@imgtec.com>
References: <1415706464-15288-1-git-send-email-Vincent.Riera@imgtec.com>
 <1415706464-15288-3-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <54620B25.4050306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/14 12:47, Vicente Olivert Riera wrote:
> +sha256  741b556863c069ceab2d81eb54aeda8c34f46728859704eaf9baef8503e9a9d1  elfutils-0.160.tar.bz2
> +sha256  feb307acf472598ea7af4e4b439251613a8f5d81e804b4abf9aeca195a5d4254  elfutils-portability.patch

 Forgot to mention in my previous review: I verified the first hash against the
upstream gpg signature, and I verified the second hash against my local download.

 I also did a simple build test. So:

Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 [for -next, and if the 0006 patch subject is modified]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
