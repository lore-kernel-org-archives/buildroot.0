From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 23:33:35 +0100
Subject: [Buildroot] [PATCH 01/10] toolchain/common: add minimum kernel
	headers options
In-Reply-To: <be10daa58b2684239e80484fad4fe0bba433eea8.1392571021.git.yann.morin.1998@free.fr>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
 <be10daa58b2684239e80484fad4fe0bba433eea8.1392571021.git.yann.morin.1998@free.fr>
Message-ID: <53028E3F.9000701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/02/14 18:27, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> We now have quite a few packages that depend on the kernel headers to be
> at least a certain version. For example, dvb-apps requires at least the
> 3.3 kernel headers.
> 
> Add a set of options that packages can depend on, to check that the kernel
> headers match their required version.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

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
