From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 18 Jan 2014 21:29:12 +0800
Subject: [Buildroot] [PATCH] netstat-nat: add license information
In-Reply-To: <20140118132541.GB3400@free.fr>
References: <1390050005.16621.1.camel@phoenix> <20140118132541.GB3400@free.fr>
Message-ID: <CAFRkauAfFcaAuk70smx__Vov+SFbObJ=DvmnS+gxNdQ68i6Aaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014/1/18 Yann E. MORIN <yann.morin.1998@free.fr>:
> Axel, All,
>
> On 2014-01-18 21:00 +0800, Axel Lin spake thusly:
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>> ---
>>  package/netstat-nat/netstat-nat.mk | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
>> index d94c6f0..a936086 100644
>> --- a/package/netstat-nat/netstat-nat.mk
>> +++ b/package/netstat-nat/netstat-nat.mk
>> @@ -6,5 +6,7 @@
>>
>>  NETSTAT_NAT_VERSION = 1.4.10
>>  NETSTAT_NAT_SITE = http://tweegy.nl/download
>> +NETSTAT_NAT_LICENSE = GPL
>
> This should be GPLv2+
Ah... OK, I'm sending v2 now.
The netstat-nat.spec is misleading, it shows License : GPL.
However, the COPYING shows GPLv2+.

Thanks for the review,
Axel
