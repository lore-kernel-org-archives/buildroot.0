From: Martin Creutziger <buildroot@martin.creutziger.net>
Date: Tue, 03 Sep 2013 11:21:31 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx.mk typo corrected
In-Reply-To: <87d2orb57s.fsf@dell.be.48ers.dk>
References: <5224AC58.6050001@martin.creutziger.net>
 <87d2orb57s.fsf@dell.be.48ers.dk>
Message-ID: <5225AA1B.3070307@martin.creutziger.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Martin" == Martin Creutziger <buildroot@martin.creutziger.net> writes:
>
>   Martin> There is a simple typo in package/ti-gfx/ti-gfx.mk, which the
>   Martin> following patch corrects:
>
>   Martin> Signed-off-by: Martin Creutziger <buildroot@martin.creutziger.net>
>   Martin> ---
>   Martin> Index: package/ti-gfx/ti-gfx.mk
>   Martin> ===================================================================
>   Martin> --- package/ti-gfx/ti-gfx.mk	(revision 14043)
>   Martin> +++ package/ti-gfx/ti-gfx.mk	(working copy)
>
> Committed, thanks.
>
> In the future, please consider creating the patch using git so it can be
> directly committed with git am (or atleast add one more directory level,
> as git am expects patch -p1 format).
>

Hello Peter,

as this was my first patch here on the mailing list, I already expected 
that I won't get it 100% right ;)

I created it directly out of our SVN repository, but thanks for the 
pointers about the expected format - I'll try to get closer to it next 
time. :)

BR,
Martin
