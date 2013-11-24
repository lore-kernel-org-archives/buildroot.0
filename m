From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Nov 2013 10:04:16 +0100
Subject: [Buildroot] [PATCH 1/5] package/rpi-firmware: only install one
 firmware file
In-Reply-To: <0d74df03558aab514aaa7d9d04d2270eda15bd62.1385157864.git.yann.morin.1998@free.fr>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
 <0d74df03558aab514aaa7d9d04d2270eda15bd62.1385157864.git.yann.morin.1998@free.fr>
Message-ID: <5291C110.7070409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/13 23:50, Yann E. MORIN wrote:
> From: "Yann E. MORIN"<yann.morin.1998@free.fr>
>
> Since only one firmware is used to boot the Raspberry Pi, there is no
> reason to install all of them.
>
> Add an option to select what firmware to install.
>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>

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
