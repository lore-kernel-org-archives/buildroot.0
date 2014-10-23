From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 23 Oct 2014 19:47:35 +0200
Subject: [Buildroot] [PATCH 1/2] system/skeleton: make nsswitch install
	conditional
In-Reply-To: <54480A4E.7030900@zacarias.com.ar>
References: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>
 <20141020150209.5f8b45a5@free-electrons.com>
 <54450BF5.4000202@zacarias.com.ar>
 <20141020152759.4f438890@free-electrons.com>
 <54450F51.5050801@zacarias.com.ar>
 <20141020153719.034df3be@free-electrons.com>
 <54451174.5060309@zacarias.com.ar>
 <20141020155447.21c7c7ff@free-electrons.com>
 <5445185C.6020604@zacarias.com.ar>
 <20141020162811.4c3e2ce5@free-electrons.com>
 <CAGduivwEezhtmw0OfpqELQs2k3sGF_StUdC7hyqAWuKXj6u1yA@mail.gmail.com>
 <54480916.6070704@zacarias.com.ar> <54480A4E.7030900@zacarias.com.ar>
Message-ID: <CAGduivw7xJWXgweVZ_kktQKvtJrqSr0QzT=zpwG8_q8XhJ6Hgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 22, 2014 at 9:49 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 10/22/2014 04:44 PM, Gustavo Zacarias wrote:
>
>> 5) Make sysvinit without busybox work really well: this needs the
>> addition of a couple of packages (ifupdown if we plan on doing that for
>> interfaces for SysV-style), and start-stop-daemon (i don't recall OTOH
>> which debian package ships it but it's available).
>> And document what's required - i don't think it's work to select heaven
>> & hell automatically since it's pretty subjective.
>
> s/work/worth/
>
>> I don't recall more right now :)
>> Regards.
>
> 7) Make a common template for sysv initscripts and update the current
> ones - they're pretty divergent right now.
>
> 8) Most embedded systems won't shutdown in the distribution sense, but
> still we should do K* initscript symlinks where appropiate.
I have pasted that in my todo, I'll work on this and send you a link
to a branch so we can work this one out.
>
> Regards.
