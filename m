From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 22:33:03 +0100
Subject: [Buildroot] [PATCH 0/3] Minor toolchain improvements
In-Reply-To: <1384192652-4203-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 Nov 2013 18:57:29 +0100")
References: <1384192652-4203-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87li0u62uo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

> Hello,
> Three minor toolchain patches, which I think are good for 2013.11,
> that:

>  * Remove the 'experimental' marker from glibc/eglibc support in the
>    internal toolchain backend. I don't think issues have been raised
>    so far with the glibc/eglibc support, so it's time to encourage
>    users to test them :-)

>  * Ensure glibc or eglibc are not chosen with static only builds,
>    since glibc and eglibc are known not to work for a pure static
>    system. An user even had the not-so-nice experience of debugging
>    why he couldn't log into his system: it was due to glibc/eglibc
>    needing some shared library for authentication, and he had selected
>    static library only.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
