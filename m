From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Dec 2015 14:57:50 +0000
Subject: [Buildroot] [PATCH 2/2] Use libgudev as regular dependency
In-Reply-To: <1449055626-4640-2-git-send-email-yegorslists@googlemail.com>
References: <1449055626-4640-1-git-send-email-yegorslists@googlemail.com>
 <1449055626-4640-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <56659E6E.2060704@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On 02/12/15 11:27, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Since eudev 3.1.3 libgudev is not shipped with this package,
> so libgudev can be used as regular dependency regardless of
> udev implementation selected.
> 
> Fixes following build error:
>   http://autobuild.buildroot.net/results/320/320c052bda0f1b5afb1e5c83a7fb4dca6227c5a1//
>   http://autobuild.buildroot.net/results/3b0/3b096f882030325b9290ad8860bd9cd373a11dc2//
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Tested with this recent modem-manager autobuild failure:

http://autobuild.buildroot.net/results/373/3735baba46dee5bd846cc830e1e198ed783452c7/

Regards,

Vincent.
