From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Jan 2019 22:41:07 +0100
Subject: [Buildroot] [PATCH v2] infra/pkg-cmake: use an
 obviously-invalid value for CMAKE_SYSTEM_VERSION
In-Reply-To: <20190115210729.6014-1-yann.morin.1998@free.fr>
References: <20190115210729.6014-1-yann.morin.1998@free.fr>
Message-ID: <182145c2-18e0-9fa1-1d6a-1739f113ddac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/01/2019 22:07, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> ---
> Changes v1 -> v2:
>   - directly hard-code the condtant in toolchainfile.cmake.in  (Thomas)
> 
> Arnout, despite the change, I kept your acked-by tag; I believe that was
> appropriate, as you explained why you acked it, and that condition has
> not changed. I hope that is OK.

 Absolutely.

 Regards,
 Arnout
