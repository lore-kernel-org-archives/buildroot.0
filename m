From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 13 May 2009 18:12:34 -0300
Subject: [Buildroot] [GIT PULL] For 2009.05-rc2
In-Reply-To: <d6cda7730905131410s1d88ebdm2c8000e4f28715d9@mail.gmail.com>
References: <d6cda7730905131309t2c0f8f21m2841072f983c71ac@mail.gmail.com>
	<87skj8rbz0.fsf@macbook.be.48ers.dk>
	<d6cda7730905131410s1d88ebdm2c8000e4f28715d9@mail.gmail.com>
Message-ID: <d6cda7730905131412m51933373yf34e21ef2ae56d80@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By the way, one or more of my patches got stuck in the mailling list
and is waiting approval because of it's size. I guess it further
illustrates that perhaps we should work differently.

2009/5/13 Thiago A. Corr?a <thiago.correa@gmail.com>:
> Hi Peter,
>
> On Wed, May 13, 2009 at 5:20 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>> Could you also please send (your own atleast) patches to the mailing
>> list for easy review?
>>
>> Use something like:
>>
>> git format-patch master
>> git send-email --to buildroot at uclibc.org 00*.patch
>>
>
> Is there some way that we could stream line this? So far this git move
> have done nothing than double or triple the amount of work I need to
> do to submit.
> After that I still need to do the work that will actually bring the
> food on the table.
>
> First one has to figure out git, then he has to setup sendmail or
> ssmtp or procmail, whatever. Personally I don't really like to leave
> my password in plain text in any /etc/*.conf
>
> I think we should find a model that is easy and works for us, not for
> the linux kernel with countless people, lots of mailling lists and
> several subsystems with maintainers for each.
>
> Thanks,
> ? ?Thiago A. Correa
>
