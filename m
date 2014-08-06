From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 19:52:41 +0200
Subject: [Buildroot] [PATCH] gcc 4.9.1: add patch for PR60102
In-Reply-To: <1407268285-9329-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407268285-9329-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140806195241.3b37c055@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  5 Aug 2014 16:51:25 -0300, Gustavo Zacarias wrote:
> Fixes ICE for SPE ABI, see:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
> 
> And re-enable gcc 4.9.1 for SPE.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gcc/4.9.1/841-PR60102.patch | 388 ++++++++++++++++++++++++++++++++++++
>  package/gcc/Config.in.host          |   1 -
>  2 files changed, 388 insertions(+), 1 deletion(-)
>  create mode 100644 package/gcc/4.9.1/841-PR60102.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
