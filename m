From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 14:13:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: boost-filesystem needs
 wchar
In-Reply-To: <1437142516-12378-1-git-send-email-joerg.krause@embedded.rocks>
References: <1437142516-12378-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150718141356.6cd14110@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 17 Jul 2015 16:15:16 +0200, J?rg Krause wrote:
> Also add reverse dependency for cc-tool.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2c7/2c7783b7f3cc28d54d15a7f017442c48244ffd8e/
> http://autobuild.buildroot.net/results/2c7/2c7783b7f3cc28d54d15a7f017442c48244ffd8e/
> http://autobuild.buildroot.net/results/0dd/0dd3ef96bbd034a41d908cdaa6552b27fda78132/
> http://autobuild.buildroot.net/results/34b/34b55b2cd83fd5d87af4a9c15d05094b16ef3960/
> 
> and many more
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/boost/Config.in   | 4 ++++
>  package/cc-tool/Config.in | 5 +++--
>  2 files changed, 7 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
