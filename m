From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 30 Dec 2014 15:00:48 +0100
Subject: [Buildroot] [PATCH v6 0/3] Improve silent builds
In-Reply-To: <1419939667-27095-1-git-send-email-fabio.porcedda@gmail.com>
References: <1419939667-27095-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHkwnC8X50KAknRTBvQduQ3jK7+ereso3EzU3oDtg=Rzi6MGPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 30, 2014 at 12:41 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> This patch set improves silent builds.
>
> Silent builds are also nice when top-level parallel make is being used
> to reduce the output clutter.
>
> After this patch set is accepted I will prepare a patch set to convert
> the other helpers (scp wget hg) to use the quiet flag instead of the
> environment variable.
>
> The change logs are also in each patch.
>
> v6:
>   - Remove the patch that renames QUIET to BR_QUIET
>

I've sent an updated patch set:
http://lists.busybox.net/pipermail/buildroot/2014-December/116085.html

BR
-- 
Fabio Porcedda
