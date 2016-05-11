From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 23:43:43 +0200
Subject: [Buildroot] [PATCH 05/13 v7] core/legal-info: add package
 version to license directory
In-Reply-To: <f99ee6fa-bb3a-411e-9b78-899dcad0c5b8@mind.be>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <5e1963c6feb57cd7a5096d296b86624f14bf3d8d.1462637351.git.yann.morin.1998@free.fr>
 <f99ee6fa-bb3a-411e-9b78-899dcad0c5b8@mind.be>
Message-ID: <20160511234343.55332952@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 7 May 2016 22:01:28 +0200, Arnout Vandecappelle wrote:

> > +	@$$(call legal-warning-pkg,$$($(2)_RAW_BASE_NAME),cannot save license ($(2)_LICENSE_FILES not defined))  
> 
>   I think this should stay $(2)_RAWNAME, or either it should change as well for 
> the legal-warning-source below.
> 
>   Other than that:
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I agree with Arnout here (we should keep using $(2)_RAWNAME for the
warning). Yann, what do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
