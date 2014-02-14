From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 14 Feb 2014 21:40:10 +0100
Subject: [Buildroot] [PATCH 0 of 2] busybox/uclibc: copy config file
	from configure step
In-Reply-To: <87r475l9bh.fsf@dell.be.48ers.dk>
References: <patchbomb.1392291283@argentina> <87r475l9bh.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LVERMNMb0LVXTCqbHcP8JH8y_+oOsMrwFq2V-caxV_85A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 14, 2014 at 9:37 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > This patch series changes busybox and uclibc to copy the .config file from
>  > the configure step, and not earlier (patch or extract step). This fixes the
>  > usage of OVERRIDE_SRCDIR with these packages.
>
>  > This was reported for busybox in bug #5030.
>
>  > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Committed series, thanks.

Thanks Peter!
