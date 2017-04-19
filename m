From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 19 Apr 2017 10:20:11 -0300 (BRT)
Subject: [Buildroot] [PATCH] gtest: fix usage on ARM platforms
In-Reply-To: <20170419143331.384db10e@free-electrons.com>
References: <1492602712-28828-1-git-send-email-casantos@datacom.ind.br>
 <20170419143331.384db10e@free-electrons.com>
Message-ID: <646899361.19434448.1492608011628.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Sent: Wednesday, April 19, 2017 9:33:31 AM
> Subject: Re: [Buildroot] [PATCH] gtest: fix usage on ARM platforms

> Hello,
> 
> On Wed, 19 Apr 2017 08:51:52 -0300, Carlos Santos wrote:
>> Ensure that GTest is compiled with -fPIC to allow linking the static
>> libraries with dynamically linked programs. This is not a requirement
>> for most architectures but is mandatory for ARM.
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> 
> Is this fixing an autobuilder issue? If so, the reference to the
> autobuilder failure should be included in the commit log.

It was observed during a local build of one of our products which
has an ARM Cortex-A9 processor.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
