From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 4 Jan 2016 09:54:46 +0100
Subject: [Buildroot] [PATCH] python-can: bump to 1.4.1
In-Reply-To: <56899F95.6020808@mind.be>
References: <1451686709-25501-1-git-send-email-yegorslists@googlemail.com>
 <20160101222835.GD2182@free.fr> <20160101224914.GE2182@free.fr>
 <CAGm1_ktsesfzLN6GKBuNviVc1Yn-_XegksJyLuycxY+heXy=VQ@mail.gmail.com>
 <20160102111529.GG3477@free.fr> <56883B79.2050806@mind.be>
 <CA+TH9Vn0=XqUhDZO0eAj1qis6GmjAJhJob3mDhOq_q2wCMGZsw@mail.gmail.com>
 <56899F95.6020808@mind.be>
Message-ID: <CAGm1_kuuFpqDjW7+DAjbHr28PwWCe8erTGA6BW1UEuMBrkuS3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All

On Sun, Jan 3, 2016 at 11:24 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 02-01-16 22:50, Angelo Compagnucci wrote:
>> Yegor, Arnout, All
>>
>> 2016-01-02 22:04 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>>> > On 02-01-16 12:15, Yann E. MORIN wrote:
>>>> >> Yegor, All,
>>>> >>
>>> >
>>> > [snip]
>>> >
>>>> >> Still, I think we should use upstream locations, not some packaging
>>>> >> location. For example, switching to PyPi for Python packages would be
>>>> >> like switching to Debian for 'native' packages. We don't do that (except
>>>> >> when upstream has disapeared, is acting...)
>>> >
>>> >  This analogy is not quite correct. PyPi is a distribution channel, not a
>>> > downstream. Not that I can think of a better analogy though. But the important
>>> > thing is: the PyPi location is under control of the upstream author, so it is
>>> > equally upstream as the git repo. Brian Thorne (the python-can author) doesn't
>>> > upload tarballs to the bitbucket location (you only get the automatic ones), but
>>> > only to PyPi. So there really is something to be said for using PyPi as the
>>> > download location.
>> I'm following (and contributing to) python-can for more than a year
>> now and this is the first time in my memory that a release was
>> uploaded to PyPi, and this happened cause someone asked for that on a
>> project issue.
>>
>> IMHO, it will not happen in the future again if not prompted by someone.
>>
>> Indeed, I originally submitted the package using bitbucket as a source
>> location, cause it was the only available.
>
>  In that case we should stick to bitbucket as the source. If the next bump is
> still available on pypi we can still switch then.

I've emaled Brian Thorne (maintainer of python-can) about PyPi publishing.

First of all he's very glad to see python-can being included into BR.

Second he agrees, that publishing updates on PyPi is the right
solution and is willing to do so in the future.

Yegor
