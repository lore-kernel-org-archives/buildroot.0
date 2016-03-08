From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:16:20 +0100
Subject: [Buildroot] [PATCH v2] tor: disable unit-tests
In-Reply-To: <20160307134648.GA30653@waldemar-brodkorb.de>
References: <20160307134648.GA30653@waldemar-brodkorb.de>
Message-ID: <20160308211620.57576833@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Mon, 7 Mar 2016 14:46:48 +0100, Waldemar Brodkorb wrote:
> Fixes following autobuild failure for aarch64:
> http://autobuild.buildroot.net/results/13ef47c962afefbaa9ea7a95de083f885f1a8825/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   - disable unit tests globally, suggested by Thomas Petazzoni
> ---
>  package/tor/tor.mk |    1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
