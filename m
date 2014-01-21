From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 21 Jan 2014 19:07:11 +0100
Subject: [Buildroot] [PATCH 2/2] Prefer 'printf' over 'echo -e' (for
	portability)
In-Reply-To: <87ob35iv7l.fsf@dell.be.48ers.dk>
References: <1388421102-29198-1-git-send-email-bjorn.forsman@gmail.com>
 <1388421102-29198-2-git-send-email-bjorn.forsman@gmail.com>
 <CAAXf6LXy=maSi1ytsQcEMeVwvV4KvTiRPHOPMe+b12TrS1FDeA@mail.gmail.com>
 <87ob35iv7l.fsf@dell.be.48ers.dk>
Message-ID: <CAEYzJUE=nMbE_Wkm-gEM2Vtx4Ssd=jqTgcNVs64Xr1YjV=OY+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 January 2014 09:40, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> Hi,
>
>  > I find it very strange that we're mixing printf and echo in this same
>  > file. I would suggest to either use echo only, or printf only. The
>  > statement
>  > echo -e '\nblaat'
>  > is functionally equivalent to:
>  > echo
>  > echo blaat
>
>  > Your point about printf being more portable is valid, and has been
>  > raised in the past by Yann (I believe) as well.
>  > This means that moving to printf iso echo makes sense, but then this
>  > patch should be reworked as to fix the entire file.
>
>  > Note that this is just my opinion, I can't speak for the entire community.
>
> Yes, I agree. I would also like to see the same style used everywhere in
> the file.

I agree. I'll fix it and send new patches.
