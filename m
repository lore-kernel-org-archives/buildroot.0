From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Aug 2016 07:41:10 -0300
Subject: [Buildroot] [PATCH] gcc: bump 6.x series to 6.2.0
In-Reply-To: <20160823001444.6543d2e0@free-electrons.com>
References: <1471896123-31759-1-git-send-email-gustavo@zacarias.com.ar>
 <877fb8o688.fsf@dell.be.48ers.dk>
 <20160822235237.0ed535ed@free-electrons.com>
 <87twecmps7.fsf@dell.be.48ers.dk>
 <20160823001444.6543d2e0@free-electrons.com>
Message-ID: <0712471c-a4b9-c27e-56ac-c438c4fd4361@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/08/16 19:14, Thomas Petazzoni wrote:

> Hello,
>
> On Mon, 22 Aug 2016 23:56:08 +0200, Peter Korsgaard wrote:
>
>>  > Since it has the Blackfin patches, Gustavo's patch is against master.
>>
>> Yeah. Do we want it for 2016.08? It is strictly seen a bugfix release,
>> but it's a scary package to bump this close to the release.
>
> Agreed. I'd rather this see merged in next.
>
> Thomas

Hi.
It's intended for -next, i've run basic builds (arm-uclibc, arm-musl) 
with it only.
I don't always split my tree into -next since for sub 30 days hence it 
was based on master with my -next stuff in it.
Regards.
