From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 17 Feb 2016 16:17:12 -0200 (BRST)
Subject: [Buildroot] [PATCH 4/5] gtest: Upgrade to GitHub HEAD
In-Reply-To: <1629967145.779413.1445282966636.JavaMail.zimbra@datacom.ind.br>
References: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>
 <1444859483-2268-5-git-send-email-alan@softiron.co.uk>
 <20151014235522.774491e2@free-electrons.com>
 <561ED08C.5010301@softiron.co.uk>
 <1629967145.779413.1445282966636.JavaMail.zimbra@datacom.ind.br>
Message-ID: <1531197965.3282303.1455733032855.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Carlos Santos" <casantos@datacom.ind.br>
> To: "Alan Ott" <alan@softiron.co.uk>
> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, buildroot at buildroot.org
> Sent: Monday, October 19, 2015 5:29:26 PM
> Subject: Re: [Buildroot] [PATCH 4/5] gtest: Upgrade to GitHub HEAD

> Hello, Thomas and Alan,
> 
>> From: "Alan Ott" <alan@softiron.co.uk>
>> To: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
>> Cc: buildroot at buildroot.org
>> Sent: Wednesday, October 14, 2015 7:00:44 PM
>> Subject: Re: [Buildroot] [PATCH 4/5] gtest: Upgrade to GitHub HEAD
> 
>> On 10/14/2015 05:55 PM, Thomas Petazzoni wrote:
>>> On Wed, 14 Oct 2015 17:51:22 -0400, Alan Ott wrote:
>>>
>>>> +# The above revision must remain the same as the gmock package
>>>> +GTEST_SITE = $(call github,google,googletest,$(GTEST_VERSION))
>>>>   GTEST_INSTALL_STAGING = YES
>>>>   GTEST_INSTALL_TARGET = NO
>>>>   GTEST_LICENSE = BSD-3c
>>>>   GTEST_LICENSE_FILES = LICENSE
>>>> +GTEST_SUBDIR = googletest
>>> So gtest and gmock are in fact now part of the same repository/upstream
>>> project ? If that's the case, then I think we should simply get rid of
>>> the gtest and gmock packages, and have a single package named
>>> "googletest".
> 
> What about applying the submitted patches now, to fix the repository, and a
> different patch later to create the "googletest" package?
> 
>> Yes, that would probably be better. gmock depends on gtest, and gtest
>> can be standalone. Maybe we have one package with a submenu option to
>> build each target (and a dependency so gmock selects gtest).
>> 
>> Is that ok by you?
>> 
>> Alan.
> 
> Do you need any help to do this?

Hello Alan,

I noticed that this patch set is still in "Changes Requested" state. Is there anything I can do to help?

Carlos Santos (Casantos)
DATACOM, P&D
