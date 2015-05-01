From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 1 May 2015 20:29:19 +0300
Subject: [Buildroot] [PATCH 2/3] package/argp-standalone: add missing
	limits.h
In-Reply-To: <1430498686-10719-2-git-send-email-romain.naour@openwide.fr>
References: <1430498686-10719-1-git-send-email-romain.naour@openwide.fr>
 <1430498686-10719-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <CAMo8BfLy_EoVwk++MxiKnoEsxNe-KQuGNvsZSDWnRRKOPPDTDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 1, 2015 at 7:44 PM, Romain Naour <romain.naour@openwide.fr> wrote:
> Fixes:
> http://autobuild.buildroot.net/results/b80/b802cc638a4b11d2a2098b82615f2c0ccadf8e3f/build-end.log
>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/argp-standalone/0002-isprint.patch | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
