From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Nov 2015 15:02:24 +0100
Subject: [Buildroot] [PATCH] boost: fix sparc64 compile,
 set the correct instruction-set
In-Reply-To: <20151103210313.GA25989@waldemar-brodkorb.de>
References: <20151103210313.GA25989@waldemar-brodkorb.de>
Message-ID: <20151108150224.09567dcd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 3 Nov 2015 22:03:14 +0100, Waldemar Brodkorb wrote:
> The default for sparc is v7, which doesn't work for sparc64.
> Use ultrasparc for sparc64.
> Fixes following autobuild errors:
> http://autobuild.buildroot.net/results/0cad0a6eddc153098bb6d1501afd1cf4a57a82d1/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/boost/boost.mk |    4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
