From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 10:32:49 +0200
Subject: [Buildroot] [PATCH 1/7] boot/gummiboot: switch to http for git
 clone
In-Reply-To: <41ff4e16c3f2084214227c2ab90b8b6caee97d40.1430260630.git.yann.morin.1998@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
 <41ff4e16c3f2084214227c2ab90b8b6caee97d40.1430260630.git.yann.morin.1998@free.fr>
Message-ID: <20150501103249.275b80c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 29 Apr 2015 00:39:58 +0200, Yann E. MORIN wrote:
> The git:// protocol may not go through conservative corporate firewalls.
> Use http, that goes out through about anything.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  boot/gummiboot/gummiboot.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
