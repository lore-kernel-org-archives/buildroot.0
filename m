From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 12:54:54 +0200
Subject: [Buildroot] [PATCHv2 1/2] toolchain: add sparc64 architecture
 support
In-Reply-To: <20150829075733.GA19454@waldemar-brodkorb.de>
References: <20150829075733.GA19454@waldemar-brodkorb.de>
Message-ID: <20151010125454.3a1820a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sat, 29 Aug 2015 09:57:33 +0200, Waldemar Brodkorb wrote:
> Introduce sparc64 architecture to buildroot.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  - Changes v1 -> v2:
>    only allow useful architecture variants suggested by Thomas Petazzoni 
> ---
>  arch/Config.in                          |   12 +++++++++++-
>  arch/Config.in.sparc                    |   12 ++++++++++--
>  toolchain/toolchain-buildroot/Config.in |    3 ++-
>  3 files changed, 23 insertions(+), 4 deletions(-)

Both patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
