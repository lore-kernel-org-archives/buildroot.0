From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 24 Nov 2016 16:21:53 +0100
Subject: [Buildroot] [PATCH v2 2/2] toolchain: kill ADI Blackfin
	toolchain
In-Reply-To: <20161123234035.6393-2-arnout@mind.be>
References: <20161123234035.6393-1-arnout@mind.be>
 <20161123234035.6393-2-arnout@mind.be>
Message-ID: <20161124152153.GF27313@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle (Essensium/Mind) wrote,

> This toolchain has many problems which are fixed in contemporary gcc
> and uClibc-ng. In addition, several hacks are needed to be able to
> work with this toolchain. All these hacks are removed as well.  Also
> the package exceptions for this toolchain are removed.
> 
> The BR2_BFIN_INSTALL_FDPIC_SHARED and BR2_BFIN_INSTALL_FLAT_SHARED
> options don't get a legacy entry. For the ADI toolchain, there already
> is a legacy entry, so it doesn't make sense to add it twice. For other
> external toolchains, these options didn't actually work, because they
> rely on the specific layout of the ADI toolchain.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

ACK from me. May be we convince ADI people to get more stuff fixed
upstream, when this toolchain is removed. 

best regards
 Waldemar
