From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 29 May 2014 17:03:14 +0000 (UTC)
Subject: [Buildroot] python 2 or 3
References: <20140528194852.fe13e0e104246a21d4742916@lavabit.com>
 <87r43d9hf4.fsf@dell.be.48ers.dk>
 <20140529081348.e67be25036aefa1f48864236@lavabit.com>
Message-ID: <lm7p8h$gel$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-05-29, rh_ <richard_hubbe11@lavabit.com> wrote:
> On Thu, 29 May 2014 09:23:59 +0200 Peter Korsgaard <jacmet@uclibc.org> wrote:
>
>> I haven't investigated it yet. Do you really want to build a
>> statically linked python?
>
> FWIW, I think I saw that link before I posted. I did intend to build
> a statically linked python

We know.  The question is why do you want to build a _statically_
linked python?  (As opposed to a dynamically linked one.)

> but have given up for now.
>
> I built a statically linked perl instead. I needed something that
> didn't end with "sh" to write programs. I've been doing more python
> than perl but perl will be fine.

But why does it need to be statically linked?

-- 
Grant Edwards               grant.b.edwards        Yow! I didn't order any
                                  at               WOO-WOO ... Maybe a YUBBA
                              gmail.com            ... But no WOO-WOO!
