From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 9 Jan 2014 15:28:53 +0000
Subject: [Buildroot] [PATCH 2/2] sdl: Fix compilation with libX11 >=
	1.5.99.902
In-Reply-To: <878uupdvqj.fsf@dell.be.48ers.dk>
References: <1389268653-45909-1-git-send-email-Vincent.Riera@imgtec.com>
 <1389268653-45909-2-git-send-email-Vincent.Riera@imgtec.com>
 <87lhype3bi.fsf@dell.be.48ers.dk> <52CE9FA6.2020909@imgtec.com>
 <87d2k1e19f.fsf@dell.be.48ers.dk> <878uupdvqj.fsf@dell.be.48ers.dk>
Message-ID: <52CEC035.2090503@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/09/2014 03:24 PM, Peter Korsgaard wrote:
>>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
>
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
>   >>> Hmm, this ends up relying on the use having compatible auto* tools
>   >>> installed on the build machine. Are you sure we cannot use our
>   >>> pkg_AUTORECONF = YES handling?
>
>   >> I tried it but I can't get it working properly. Maybe you could try it.
>
>   > ok, I'll take a look.
>
> autoheader indeed errors out (without any error message :/), so I kept
> it like this (with a description why and the needed host-* dependencies
> added).
>
> Committed series with those changes, thanks.
>

Thanks to you Peter.

Maybe I could try to help you to fix it the way that you want. If you 
have some time you can ping me at IRC.

Best regards,

-- 
Vincent
