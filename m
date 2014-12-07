From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:08:37 +0100
Subject: [Buildroot] [PATCH 1/5 v2] pkg-download: fix arguments to hash
 checking script
In-Reply-To: <2887bc5c3ac5d965f032c7b3318b95d28a2029b3.1417949583.git.yann.morin.1998@free.fr>
References: <cover.1417949583.git.yann.morin.1998@free.fr>
 <2887bc5c3ac5d965f032c7b3318b95d28a2029b3.1417949583.git.yann.morin.1998@free.fr>
Message-ID: <20141207220837.78400b87@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  7 Dec 2014 12:02:34 +0100, Yann E. MORIN wrote:
> The argument are correctly used, but incorrectly documented.
> Inverse the comments to match the actual usage.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  support/download/check-hash | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
