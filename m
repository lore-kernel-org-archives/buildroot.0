From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 18 Feb 2016 17:26:18 -0200 (BRST)
Subject: [Buildroot] [PATCH 4/5] gtest: Upgrade to GitHub HEAD
In-Reply-To: <20160218171814.7709b731@free-electrons.com>
References: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>
 <561ED08C.5010301@softiron.co.uk>
 <1629967145.779413.1445282966636.JavaMail.zimbra@datacom.ind.br>
 <1531197965.3282303.1455733032855.JavaMail.zimbra@datacom.ind.br>
 <20160217215023.79adbe1c@free-electrons.com>
 <3E1323DE-EB35-4012-9DD2-BC0448C4A84B@softiron.co.uk>
 <1397733218.10703.1455812066287.JavaMail.zimbra@datacom.ind.br>
 <20160218171814.7709b731@free-electrons.com>
Message-ID: <57594283.82586.1455823578308.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "Alan Ott" <alan@softiron.co.uk>, buildroot at buildroot.org
> Sent: Thursday, February 18, 2016 2:18:14 PM
> Subject: Re: [Buildroot] [PATCH 4/5] gtest: Upgrade to GitHub HEAD

> Hello,
> 
> On Thu, 18 Feb 2016 14:14:26 -0200 (BRST), Carlos Santos wrote:
> 
>> 1. Submit a patchset that replaces the sites from googlecode.com to github,
>> maintaining the same package versions (including gtest and gmock, that would be
>> left at version 1.7.0).
>> 
>> This change is easy to apply and could even be brought to the impending
>> Buildroot 2016.02, IMO, since it does not change the package versions, only
>> reduces the risk of build failures due to problems in googlecode.com (I
>> consider this a bug fix). The patchset would update the following patches:
>> 
>>     http://patchwork.ozlabs.org/patch/530387/
>>     http://patchwork.ozlabs.org/patch/530388/
>>     http://patchwork.ozlabs.org/patch/530389/
>>     http://patchwork.ozlabs.org/patch/530390/
>>     http://patchwork.ozlabs.org/patch/530391/
>> 
>> 
>> 2. Submit a patchset that replaces packages gtest and gmock by a "googletest"
>> package, as suggested by Thomas. This change is quite disruptive for us at
>> DATACOM because it may require changing the recipes that we maintain in
>> $(BR2_EXTERNAL), so I humbly ask you to postpone the change.
>> 
>> 3. Submit a patchset that upgrades googletest to a newer release, hopefully
>> v1.8.0, or to the current HEAD, as decided by Peter Korsgaard and Alan. I will
>> do this after ensuring that the change does not break anything.
> 
> Sounds good. Note that (1), (2) and (3) could also be part of the same
> patch series if you wish. But it's fine to have (1) first, wait to get
> it merge, and only then continue with (2) and (3).

Thomas,

Considering that my work will focus on GTest/GMock I thing that patches 530387 through 530389 can be applied, leaving 530390 and 530391 in "Changes Requested" state. Do you agree?

Carlos Santos (Casantos)
DATACOM, P&D
