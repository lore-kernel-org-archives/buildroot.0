From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 15:08:02 +0200
Subject: [Buildroot] [PATCH v2] directfb: depends on NPTL threading
In-Reply-To: <20160708222129.GA22796@waldemar-brodkorb.de>
References: <20160708222129.GA22796@waldemar-brodkorb.de>
Message-ID: <20160717150802.359bc380@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 9 Jul 2016 00:21:29 +0200, Waldemar Brodkorb wrote:
> Fixes following autobuild failure:
> http://autobuild.buildroot.net/results/162db0d62075a16c7abae1229676e2cdb29fe953/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   - rather adding an experimental patch without runtime testing for
>     an unmaintained software, we depend on NPTL as discussed with
>     Thomas Petazzoni on IRC
> ---
>  package/directfb/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've applied, after adjusting the Config.in comment, as noticed by
Romain Naour.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
