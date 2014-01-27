From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 27 Jan 2014 20:47:33 +0100
Subject: [Buildroot] [PATCH 1/1] Prefer 'command -v' over 'which' (for
	portability)
In-Reply-To: <20140127074408.0481487f@skate>
References: <1390659116-18865-1-git-send-email-bjorn.forsman@gmail.com>
 <20140127074408.0481487f@skate>
Message-ID: <CAEYzJUEcVuW0Xx4onrOGuTz3rcgQOyz9gfOoe754zDndcEii4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27 January 2014 07:44, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Bj?rn Forsman,
>
> On Sat, 25 Jan 2014 15:11:56 +0100, Bj?rn Forsman wrote:
>
>>   $ make
>>
>>   You must install 'which' on your build machine
>>   make: *** [core-dependencies] Error 1
>
> But then, do we still need to have "which" installed? Maybe this hard
> dependency is no longer necessary?

Don't know. I was under the impression that "which" was used by
autotools, but I didn't check it.
