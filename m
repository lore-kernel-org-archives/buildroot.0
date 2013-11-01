From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 16:39:45 +0100
Subject: [Buildroot] [PATCH] cppzmq/czmq: Update comment for needs
 threads support
In-Reply-To: <1382334782.6613.0.camel@phoenix>
References: <1382334782.6613.0.camel@phoenix>
Message-ID: <20131101163945.36fca8da@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Mon, 21 Oct 2013 13:53:02 +0800, Axel Lin wrote:
> Comment 7e37d235f "zeromq: needs threads" adds BR2_TOOLCHAIN_HAS_THREADS
> dependency but forgot to add corresponding comment for cppzmq and czmq. Fix it.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  package/cppzmq/Config.in | 2 +-
>  package/czmq/Config.in   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to for-peter-2013.11, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
