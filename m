From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Mon, 9 May 2016 21:56:25 +0200
Subject: [Buildroot] [PATCH 23/34] pkg-download: allow git+ssh URLs
In-Reply-To: <87k2j3n37e.fsf@dell.be.48ers.dk>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-23-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160507223904.1217db52@free-electrons.com>
 <87k2j3n37e.fsf@dell.be.48ers.dk>
Message-ID: <20160509195625.GX13285@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 09, 2016 at 08:41:09AM +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Hello,
>  > On Sat, 30 Apr 2016 09:49:19 +0200, Gilles Chanteperdrix wrote:
>  >> ---
>  >> package/pkg-download.mk | 2 +-
>  >> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
>  > This looks good I believe, so please resend with your SoB line. Maybe
>  > an update to the Buildroot manual is also needed.
> 
> I'm not sure we want to advertise this feature too much (or at least
> mention it is deprecated). I've personally not heard about git+ssh://,
> and googling around I didn't find anything right away.

Well, I always used git+ssh://, I did not even know it was
deprecated. The advantage of git+ssh is that the scheme clearly
identifies git over ssh, so we can choose the git helper. If we got
the ssh scheme to do the same and other revision control systems
used ssh URL (I do not even know, I have not been using something
else than git for a long time), it is not going to be possible to
find out which helper to use.

One way or another, I believe it is helpful to be able to use git
over ssh URLs, are they may be used for projects specific to a
company, not public.

Regards.

-- 
					    Gilles.
https://click-hack.org
