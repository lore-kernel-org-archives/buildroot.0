From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 09:22:18 +0200
Subject: [Buildroot] [PATCH] ifupdown: wordexp is enabled in uClibc now
In-Reply-To: <20170430084120.GA17431@waldemar-brodkorb.de>
References: <20170430084120.GA17431@waldemar-brodkorb.de>
Message-ID: <20170501092218.6ae351de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Apr 2017 10:41:20 +0200, Waldemar Brodkorb wrote:
> Package can now be used for uClibc toolchains.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/ifupdown/Config.in | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
