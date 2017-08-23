From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 23:21:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/zmqpp: link with libatomic when
 needed
In-Reply-To: <20170818055007.13273-1-bernd.kuhls@t-online.de>
References: <20170818055007.13273-1-bernd.kuhls@t-online.de>
Message-ID: <20170823232159.0b6c286c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Aug 2017 07:50:07 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/c32/c32b9b8dd00d6f6d3db27fae9d8de758a4f25138/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/zmqpp/zmqpp.mk | 4 ++++
>  1 file changed, 4 insertions(+)

I still hate this solution, but we don't have much choice, Boost build
system is really unmanageable :/ So: applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
