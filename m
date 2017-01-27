From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 21:54:08 +1300
Subject: [Buildroot] [PATCH] rtl8188eu: Move the post install target
 hook before the infras
In-Reply-To: <20161226150707.2663-1-ezequiel@vanguardiasur.com.ar>
References: <20161226150707.2663-1-ezequiel@vanguardiasur.com.ar>
Message-ID: <20170127215408.6c325ab6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Dec 2016 12:07:07 -0300, Ezequiel Garcia wrote:
> The hook is only used to install firmware blobs, and so it
> doesn't need to be declared after the kernel-module infra.
> Move it where it belong, to avoid confusion.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> --
> This is just a nitpick, but since contributors are likely to
> use this package as an example, let's avoid copy-pasted cluttering.
> ---
>  package/rtl8188eu/rtl8188eu.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
