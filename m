From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 29 Aug 2013 08:24:18 -0300
Subject: [Buildroot] [PATCH 12/12] toolchain: improve mudflap support
In-Reply-To: <20130829095623.75c46268@skate>
References: <1377671731-28656-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1377671731-28656-13-git-send-email-thomas.petazzoni@free-electrons.com>
 <521EE7C3.3050003@mind.be> <20130829095623.75c46268@skate>
Message-ID: <521F2F62.5050403@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/29/2013 04:56 AM, Thomas Petazzoni wrote:

>>   I would drop the option to enable -fmudflap globally, but keep the 
>> option to build mudflap support in the internal toolchain. As you wrote 
>> in another mail, mudflap is a debugging tool and not really a hardening 
>> tool like SSP.
> 
> I also agree with this. Gustavo, are you fine with this?

+1 we really don't want to make a Kconfig option out of each possible
compiler flag and, well, busybox doesn't behave with it which many
targets will use.
Regards.
