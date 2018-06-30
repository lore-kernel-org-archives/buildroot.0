From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:38:04 +0200
Subject: [Buildroot] [PATCH] Revert "zeromq: needs NPTL"
In-Reply-To: <20180505160530.GA1774@waldemar-brodkorb.de>
References: <20180505160530.GA1774@waldemar-brodkorb.de>
Message-ID: <20180630183804.5c2fc81b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 5 May 2018 18:05:31 +0200, Waldemar Brodkorb wrote:
> This reverts commit 1e2a8d4111f57e79c1848c7a70c6501e2bdacd58.
> 
> Latest uClibc-ng release supports the missing functions even for
> Linuxthreads. The toolchains must be rebuilded before commit.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/circus/Config.in       | 6 +++---
>  package/cppzmq/Config.in       | 6 +++---
>  package/czmq/Config.in         | 6 +++---
>  package/filemq/Config.in       | 6 +++---
>  package/mongrel2/Config.in     | 6 +++---
>  package/php-zmq/Config.in      | 6 +++---
>  package/python-pyzmq/Config.in | 6 +++---
>  package/zeromq/Config.in       | 6 +++---
>  package/zmqpp/Config.in        | 6 +++---
>  package/zyre/Config.in         | 6 +++---
>  10 files changed, 30 insertions(+), 30 deletions(-)

Now that I have rebuilt and deployed updated toolchains, I've applied
this patch after fixing the commit log, as we discussed previously.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
