From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 23:05:17 +0200
Subject: [Buildroot] [PATCH 1/1] musl: Make only shared libraries
 conditional
In-Reply-To: <1444922838-16841-1-git-send-email-chaduffy@cisco.com>
References: <1444922838-16841-1-git-send-email-chaduffy@cisco.com>
Message-ID: <20151019230517.00a4ae51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Duffy,

On Thu, 15 Oct 2015 10:27:18 -0500, Charles Duffy wrote:
> From: Charles Duffy <charles@dyfis.net>
> 
> External toolchain use requires a static libc (as buildroot uses
> `gcc --print-file-name libc.a` to find the sysroot); thus, the static portion
> of a musl build should not be conditional.
> 
> Signed-off-by: Charles Duffy <chaduffy@cisco.com>
> ---
>  package/musl/musl.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
