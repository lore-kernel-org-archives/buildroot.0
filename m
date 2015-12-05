From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Dec 2015 18:25:07 +0100
Subject: [Buildroot] [PATCH 1/2] package/gawk: clean the mpfr dependency
In-Reply-To: <20151205160851.GA3666@free.fr>
References: <cover.1449181275.git.yann.morin.1998@free.fr>
 <6dcb0e2bfe0573ddcfba8f9b7c90d18090c46a1a.1449181275.git.yann.morin.1998@free.fr>
 <5660D1B6.5040404@mind.be> <20151205160851.GA3666@free.fr>
Message-ID: <56631DF3.5050403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-12-15 17:08, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-12-04 00:35 +0100, Arnout Vandecappelle spake thusly:
>> On 03-12-15 23:22, Yann E. MORIN wrote:
>>> When available, mpfr provides support for BIGNUM, which allows gawk to
>>> work on arbitrarily-large numbers (hence the name).
>>>
>>> Forcibly disable mpfr if the mpfr package is not enabled. Let
>>> ./configure find it automatically when it is enabled.
>>>
>>> To be noted, the host-gawk needs not have BIGNUM to build the target
>>                              ^^^^^^^^^ doesn't need to have
> 
> No, sorry, this was correct english grammar:
>     https://dictionary.cambridge.org/grammar/british-grammar/need
> 
>     We form the negative by adding not after need. Need not can be
>     contracted to needn?t. We don?t use don?t/doesn?t/didn?t with the
>     semi-modal verb need:
> 
>     You need not spend a lot of money on presents. (formal) (or You
>     needn?t spend a lot of money on presents.)
> 
>     Not: You don?t need spend a lot of money on presents.
> 
> Or:
>     http://www.merriam-webster.com/dictionary/need
> 
>     verbal auxiliary
>     : be under necessity or obligation to <you need not answer>
>     <she need only wait> 
> 
> In this case, 'need' is a verbal auxiliary, not a transitive verb (and
> even less so an intransitive verb).

 But then it's "need not", not "needs not". (Quotation marks really are needed
in this sentence :-)

 Or, to avoid discussion:

The build of the target gawk doesn't require host-gawk with BIGNUM support.

:-P


 Regards,
 Arnout

> 
> (yes, in case you still had a doubt, I speak british English, not
> american English.)
> 
[snip]

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
