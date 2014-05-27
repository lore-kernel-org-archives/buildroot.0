From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 27 May 2014 21:40:36 +0200
Subject: [Buildroot] Buildroot manual: author list
In-Reply-To: <20140527193640.GE3503@free.fr>
References: <CAAXf6LXSqbJAjOi-YvEdPvcC=-XZE+6Z1Y-d2BRWEhMXu6ufFw@mail.gmail.com>
 <20140527193640.GE3503@free.fr>
Message-ID: <CAAXf6LU3ywnw5k+VC+p88Di5UC41PnnwU89Sidx9gbSfnicxOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 27, 2014 at 9:36 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2014-05-27 21:22 +0200, Thomas De Schampheleire spake thusly:
>> Currently, the Buildroot manual contains the following in the introduction:
>>
>> "Buildroot usage and documentation by Thomas Petazzoni. Contributions
>> from Karsten Kruse, Ned Ludd, Martin Herren and others."
> [--SNIP--]
>> My feeling is that the current listing of authors is not correct
>> towards all these other people. There are at least three alternatives
>> to do something about this:
>>
>> a. replace the author reference in buildroot by a reference to 'the
>> Buildroot developers' and let interested people look up the real list
>> in git.
>>
>> b. expand the list with some of the major contributors to the manual,
>> based on the shortlogs above
>>
>> c. add an appendix with a generated list (shortlog) of authors, which
>> is then complete and up-to-date.
>>
>>
>> I'm leaning more to a. or b. than to c.
>> The advantage of a. over b. is that there is no discussion about whose
>> name should be in the list (where to draw the line), while b. has the
>> advantage of giving more explicit credit.
>
> As I suggested on IRC: what about a.+c.? Just change the introduction to:
>
>     Buildroot manual by the Buildroot developers, see xref:credits[].
>
> and add the appendix 'credits' at the end of the manual?

Sorry that this wasn't clear. With c. I did mean a+c as you showed above.
Although I'm certainly not against it, I (personally) don't
particularly see a need to add an explicit list for the manual. If
we'd do this, then it makes sense to also do it for the 'real'
contributions. But such info can already be obtained from git or
Ohloh.

Best regards,
Thomas
