From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 23:13:01 +0100
Subject: [Buildroot] [PATCH] docs/manual: fix bash export syntax in
 example code
In-Reply-To: <1447264061-21523-1-git-send-email-luca@lucaceresoli.net>
References: <1447264061-21523-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20151111231301.6032be66@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Wed, 11 Nov 2015 18:47:41 +0100, Luca Ceresoli wrote:
> To export a variable in .bashrc we shouldn't put a '$' at the
> beginning of the line, and there must be a '=' between key and value.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  docs/manual/download-location.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
