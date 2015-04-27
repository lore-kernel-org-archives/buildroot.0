From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:31:46 +0200
Subject: [Buildroot] [PATCH 4/4] manual: don't use a comment at the end
 of the version variable assignment
In-Reply-To: <1430091621-4698-5-git-send-email-fabio.porcedda@gmail.com>
References: <1430091621-4698-1-git-send-email-fabio.porcedda@gmail.com>
 <1430091621-4698-5-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150427233146.17250105@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Mon, 27 Apr 2015 01:40:21 +0200, Fabio Porcedda wrote:
> The comment at the end of the version string assigment could lead to a download
> failure so don't use it as a example.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  docs/manual/adding-packages-tips.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
