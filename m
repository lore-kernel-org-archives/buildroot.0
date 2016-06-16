From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Thu, 16 Jun 2016 21:43:50 +0200
Subject: [Buildroot] [PATCH 2/5] readline: fix installed libraries
	permission
In-Reply-To: <87twgu9l8k.fsf@dell.be.48ers.dk>
References: <20160614151017.GG3060@hermes.click-hack.org>
 <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465917079-30473-2-git-send-email-gilles.chanteperdrix@xenomai.org>
 <87oa73v7wc.fsf@dell.be.48ers.dk>
 <20160615213211.GB23680@hermes.click-hack.org>
 <87twgu9l8k.fsf@dell.be.48ers.dk>
Message-ID: <20160616194350.GG32532@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 15, 2016 at 11:48:43PM +0200, Peter Korsgaard wrote:
> >>>>> "Gilles" == Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org> writes:
> 
> Hi,
> 
>  > On Tue, Jun 14, 2016 at 10:21:23PM +0200, Peter Korsgaard wrote:
>  >> >>>>> "Gilles" == Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org> writes:
>  >> 
>  >> > In order to avoid strip failing to strip the library.
>  >> > Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
>  >> 
>  >> Thanks, but we already have logic in readline.mk to fix this:
> 
>  > Ok, I guess I made the original patch before you included that patch
>  > in readline.mk.
> 
> This patch was added in January. Please base your patches on recent
> versions to ensure they still apply / are needed.

I worked on these issues starting from the latest release at the
time which was 2015.11.1. I of course rebased the patch on master
(exactly commit 00bd9daf0e75f76c2d15196feb9c7f608668430e, as you can
see using the URL I posted) but I simply missed the fact that
readline.mk had been modified, because the patch applied cleanly.

> 
>  >> So why this patch instead? It would be good if we could get rid of both,
>  >> have you tried sending it upstream?
> 
>  > No, and I will not.
> 
> :/

Well, anyone else can submit it if he is interested. You can even
remove my name and put yours instead, I do not care.

-- 
					    Gilles.
https://click-hack.org
