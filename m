From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 13 Nov 2013 10:16:49 +0100
Subject: [Buildroot] [git commit] legal info: fix saving of host package
	licenses
In-Reply-To: <20131113084543.2f21dc42@skate>
References: <20131112222456.9EC029BB31@busybox.osuosl.org>
 <CAAXf6LUxdhxXxJXFbn6d7pV6TrxtoiW6-dwAv_JBPxcEdoqoHQ@mail.gmail.com>
 <20131113084543.2f21dc42@skate>
Message-ID: <CAAXf6LW+_yxwbhZ1M9JdzL+L=wh5koGm7uCk6Q4FkMDkmaArRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Peter,

On Wed, Nov 13, 2013 at 8:45 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Wed, 13 Nov 2013 08:34:22 +0100, Thomas De Schampheleire wrote:
>
>> Is there a particular reason why the 5 other patches in this series
>> (splitting the legal info output between host/target) have not been
>> applied? I think they still fit in 2013.11...
>
> I believe PATCH 1 was considered as being a fix, while the other
> patches are adding a new feature, and it was too late in the cycle to
> add them.

Well, these patches have been around for much longer than this month,
even long before the buildroot developer days (during which I
highlighted the series on framapad). The core patches had been acked
and tested by Luca. The only changed patch was the first one after
Arnout's helpful comments after my ping this week.

>
> We were already November, 13th, that is 13th days late than the normal
> -rc1 date, so I definitely support Peter in not having merged all the
> possible pending features in 2013.11.
>
> That's all what time-based releases are for: stopping merging new
> features at some point, knowing that they will anyway be merged in
> -next pretty soon and be part of the following release 3 months later.

While I understand and agree with this principle for new patches, I
think that patches that have just been waiting to be merged are a
little different, unless there is an expected risk. Version bumps
clearly add risk, but in my opinion the proposed patches do not.

Anyway, it's not that big of a deal. Let's focus now on stabilization
and autobuild fixes.

Best regards,
Thomas
