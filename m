From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Jul 2014 19:21:44 -0300
Subject: [Buildroot] [PATCH 1/1] mpd: Remove unsupported libcue
In-Reply-To: <1406758697-1368-1-git-send-email-jkrause@posteo.de>
References: <1406758697-1368-1-git-send-email-jkrause@posteo.de>
Message-ID: <53D96FF8.3030307@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/30/2014 07:18 PM, J?rg Krause wrote:

> Support for libcue has been removed for mpd since version 0.17.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/mpd/Config.in | 6 ------
>  1 file changed, 6 deletions(-)

Hi.
Care to resend a new version removing it from package/mpd/mpd.mk as well?
Thanks.
Regards.
