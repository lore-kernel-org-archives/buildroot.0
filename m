From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 4 Nov 2013 09:28:11 +0100
Subject: [Buildroot] Github URL used to fetch packages
In-Reply-To: <20131104092646.743d423e@skate>
References: <CAGduivwP_AykQSnspeAWqSxxNbMRLwRja_h0BDLYRX3scmDCTQ@mail.gmail.com>
 <5277484F.4070402@mind.be> <20131104092646.743d423e@skate>
Message-ID: <CAAXf6LXv=0OGYGgdNynKegwXNmSj=s0mYG1ZpinAAhY94fDdvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Nov 4, 2013 at 9:26 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Arnout Vandecappelle,
>
> On Mon, 04 Nov 2013 08:10:07 +0100, Arnout Vandecappelle wrote:
>
>>   I like the idea. We would typically do this with some auxiliary
>> variables instead of a new download method, but maybe the download method
>> isn't such a bad idea. It would add even more complexity to the horrible
>> pkg-download.mk, though...
>>
>>   Bottom line: the idea is good, but let's see if the implementation can
>> be acceptable.
>
> Instead of a new download method, can it simply be a helper function,
> like:
>
> FOO_SITE = $(call github,<user>,<package>,<version>)
>
> or something like that. This way we don't clutter the core of the
> download infrastructure with another site method that isn't really a
> site method.

I'm ok with this suggestion.

Best regards,
Thomas
