From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 16 Jul 2015 17:51:40 -0300 (BRT)
Subject: [Buildroot] [PATCH v2 1/1] gmock: new package
In-Reply-To: <1309988878.2915051.1437046491484.JavaMail.zimbra@datacom.ind.br>
References: <1425304883-4332-2-git-send-email-casantos@datacom.ind.br>
 <1431713119-2821-1-git-send-email-casantos@datacom.ind.br>
 <CAHXCMML+4JgBr1msNmu8Z4Ja0FjmR1TficJq4d5nfnPXaXTg6A@mail.gmail.com>
 <1309988878.2915051.1437046491484.JavaMail.zimbra@datacom.ind.br>
Message-ID: <372542373.3130789.1437079900388.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Carlos Santos" <casantos@datacom.ind.br>
> To: "Samuel Martin" <s.martin49@gmail.com>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Thursday, July 16, 2015 8:34:51 AM
> Subject: Re: [Buildroot] [PATCH v2 1/1] gmock: new package
[...]
>> From: "Samuel Martin" <s.martin49@gmail.com>
>> To: "Carlos Santos" <casantos@datacom.ind.br>
>> Cc: "buildroot" <buildroot@buildroot.org>
>> Sent: Tuesday, July 14, 2015 7:09:34 AM
>> Subject: Re: [Buildroot] [PATCH v2 1/1] gmock: new package
[...]
>>> +GMOCK_SOURCE = gmock-$(GMOCK_VERSION).zip
>>> +GMOCK_SITE = http://googlemock.googlecode.com/files
>>> +GMOCK_INSTALL_STAGING = YES
>>> +GMOCK_INSTALL_TARGET = NO
>>> +GMOCK_LICENSE = BSD-3c
>>> +GMOCK_LICENSE_FILES = LICENSE
>>> +GMOCK_DEPENDENCIES = gtest
>>> +HOST_GMOCK_DEPENDENCIES = host-python

>> Does this require python2? or can it work with python3?
> 
> I did not test with python3. I will give it a try and update gmock.mk
> accordingly.

Is there a way to select between host-python and host-python3? I can select either python or python3 via menuconfig in

    Target packages -> Interpreter languages and scripting

but this would add python to the target system.

Carlos Santos (Casantos)
DATACOM, P&D
