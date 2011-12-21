From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 21 Dec 2011 09:21:58 +0100
Subject: [Buildroot] [PATCH v3 2/2] New package: python-dpkt
In-Reply-To: <20111221091337.1d310b75@skate>
References: <1323877116-31436-1-git-send-email-yegorslists@googlemail.com>
 <201112210754.28934.arnout@mind.be> <20111221091337.1d310b75@skate>
Message-ID: <4EF19726.3070605@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 21.12.2011 09:13, schrieb Thomas Petazzoni:
> Le Wed, 21 Dec 2011 07:54:28 +0100,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
> 
>> Alternatively, the information could be passed in environment variables
>> which are set in the .mk file.
> 
> Yerk, no. This patch has to go upstream: it's silly for the setup.py
> script of a Python module to require this Python module to already be
> installed.

What would speak against compiling host-python with zlib support? I think we'll need it for host-setuputils anyway. AFAIK python-dpkt seems to be neglected for quite a while. Though I submitted a bug report: http://code.google.com/p/dpkt/issues/detail?id=82, I don't think it will be accepted shortly. 

Should I prepare a patch for host-python with zlib support?

Best regards,
Yegor
