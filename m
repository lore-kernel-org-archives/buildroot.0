From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 02 Feb 2014 23:14:24 +0100
Subject: [Buildroot] [PATCH 2/3] infozip: fix cross-compilation issues
In-Reply-To: <87ob2pp8xa.fsf@dell.be.48ers.dk>
References: <1391120128-8375-1-git-send-email-romain.naour@openwide.fr>	<CAAHaz6Gu=hK8VaLx8fBxZ6i1X533bPgU_Sp0gWzJO8LBpbRaSw@mail.gmail.com>
 <87ob2pp8xa.fsf@dell.be.48ers.dk>
Message-ID: <52EEC340.3020900@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Le 02/02/2014 21:16, Peter Korsgaard a ?crit :
>>>>>> "Alexander" == Alexander Lukichev <alexander.lukichev@gmail.com> writes:
>   > Hello Naour, all,
>   > 2014-01-31 Romain Naour <romain.naour@openwide.fr>:
>   > (...)
>
>   >     +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>
>   > (...)
>
>   >     +-CFLAGS = -O2 $(CFLAGS_NOOPT)
>   >     ++CFLAGS ?= -02 $(CFLAGS_NOOPT)
>
>
>   > Excuse me, is it -02 that's meant here?
>
> Good catch. Actually in the context of Buildroot we don't want the
> package to hardcode the optimization level, so I will simply drop it.
>
Sorry for that,
It's mean that I need to be more careful next time.

Thanks
Romain Naour
