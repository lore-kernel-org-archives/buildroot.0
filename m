From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 7 Sep 2016 11:24:15 -0300 (BRT)
Subject: [Buildroot] [PATCH v2,1/1] gtest: retrieve package from github
In-Reply-To: <20160906231857.60082e09@free-electrons.com>
References: <1472660994-23034-1-git-send-email-fabrice.fontaine@orange.com>
 <20160906231857.60082e09@free-electrons.com>
Message-ID: <1114700254.3685952.1473258255325.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
> Cc: "Fabrice Fontaine" <fabrice.fontaine@orange.com>, buildroot at buildroot.org
> Sent: Tuesday, September 6, 2016 6:18:57 PM
> Subject: Re: [Buildroot] [PATCH v2,1/1] gtest: retrieve package from github

> Hello,
> 
> On Wed, 31 Aug 2016 18:29:54 +0200, Fabrice Fontaine wrote:
>> https://googletest.googlecode.com/files is no more available, so update
>> gtest.mk and gtest.hash to retrieve googletest source code as a tar.gz
>> (and not a zip) from github as https://googletest.googlecode.com is now
>> a redirection to https://github.com/google/googletest.
>> 
>> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
>> ---
>> Changes v1 -> v2:
>>  - Fix patch number (6/6 to 1/1)
> 
> Applied to master, thanks. I've tried to do the same for the gmock
> package (the 1.7.0 release is available from
> https://github.com/google/googlemock/releases. However, since it's
> fetched from Github, it doesn't have the configure script
> pre-generated, and GMOCK_AUTORECONF = YES doesn't work.
> 
> I guess moving to using the CMake based build system would make more
> sense, but that's a bigger task.
> 
> Patches welcome :)

A patch was sent a long time ago, but was rejected[1]. I will update it and resubmit for review.

1. http://patchwork.ozlabs.org/patch/586130/

Carlos Santos (Casantos)
DATACOM, P&D
