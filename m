From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 08 Oct 2014 17:24:06 -0300
Subject: [Buildroot] [PATCH 1/3] package/squid: enable ICAP server
 support in squid and define logdir, pidfile and swapdir
In-Reply-To: <20141008221807.3b9e147d@free-electrons.com>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1411032426-11463-2-git-send-email-guillaume.gardet@oliseo.fr>
 <20141005235232.66d3c09c@free-electrons.com> <5435988F.70209@oliseo.fr>
 <20141008221807.3b9e147d@free-electrons.com>
Message-ID: <54359D66.3000608@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/2014 05:18 PM, Thomas Petazzoni wrote:

>> Without: 2.7 MB,and with c-icap: 3.0 MB
>>
>> Should I make it optionnal?
> 
> I would tend to say yes. Making it optional not only saves space, but
> it also makes it explicit that our Squid build can support the ICAP
> client functionality.

I wouldn't mind keeping it as is, squid is a big RAM and storage
sinkhole so it's a no-go for memory-constrained targets in general,
after all it's a caching (in disk) proxy with the RAM usage for keeping
indexes at hand.
Regards.
