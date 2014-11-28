From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 28 Nov 2014 14:10:05 +0100
Subject: [Buildroot] [PATCH v4] Makefile: improve detection of make "-s"
	flag
In-Reply-To: <1416419494-14916-1-git-send-email-fabio.porcedda@gmail.com>
References: <1416419494-14916-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHkwnC-FM6NHzXPD3rNuTwpf_aY_Lf0m3ew8KX3pKy18YW6RWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 19, 2014 at 6:51 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> Because it's just checked the presence of the "s" character even a
>   make --warn-undefined-variables
> is detected as a silent build so fix this by filtering out long options.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>
> Notes:
>     v4:
>      - split this patch from the patch set to send to muster as bugfix
>     v2:
>      - remove spurious space at the beginning of the QUIET variable (Arnout)
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

ping?

BR
-- 
Fabio Porcedda
