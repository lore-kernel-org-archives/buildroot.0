From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 19:32:07 +0200
Subject: [Buildroot] [PATCH 1/1] libuci: remove MMU dependency with Lua
 binding
In-Reply-To: <1397868421-8899-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1397868421-8899-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <20140419193207.0c7571e4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hadrien Boutteville,

On Sat, 19 Apr 2014 02:47:01 +0200, Hadrien Boutteville wrote:
> The Lua binding option of libuci doesn't need the MMU.
> 
> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> ---
>  package/libuci/libuci.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
