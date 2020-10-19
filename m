From: Christian Stewart <christian@paral.in>
Date: Mon, 19 Oct 2020 01:56:00 -0700
Subject: [Buildroot] [PATCH 2/2] package/docker-engine: bump to version
 19.03.13
In-Reply-To: <20201019085039.3429230-2-christian@paral.in>
References: <20201019085039.3429230-1-christian@paral.in>
 <20201019085039.3429230-2-christian@paral.in>
Message-ID: <CA+h8R2qnjEovd-fm4OZwZEoxa6CJKE=7hSM6GCQsq2c91ucBQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Oct 19, 2020 at 1:50 AM Christian Stewart <christian@paral.in> wrote:
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-engine/docker-engine.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This series has issues:

 - docker/engine has not tagged v19.03.13 yet
 - it may be necessary to switch to github.com/moby/moby as upstream
 - hash file needs update

Marked as superseded. Will send a v2 once tested.

Best regards,
Christian Stewart
