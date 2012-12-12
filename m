From: Woody Wu <narkewoody@gmail.com>
Date: Wed, 12 Dec 2012 23:51:09 +0000 (UTC)
Subject: [Buildroot] target not ping-able
References: <slrnkbqvei.uot.narkewoody@zuhnb712.local.com>
 <50BF7E70.4070203@mind.be>
Message-ID: <slrnkci61d.nfe.narkewoody@zuhnb712.local.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-12-05, Arnout Vandecappelle
<arnout@mind.be> wrote:
> On 04/12/12 05:37, Woody Wu wrote:
>> Hi, list
>>
>> My generated target system (kernel and rootfs) is not ping-able.
>> From the target I can ping outside, but hosts, even on the same
>> ethernet subnetwork cannot ping my target.
>>
>> The kernel is 3.4.19 and I enabled network options and an Ethernet
>> driver.  Is there anything I missed?
>
>   This is unlikely to be buildroot-related...
>
>   I would do a wireshark on the host to get more insight.  You can
>   also build a tcpdump for the target to verify if it even receives
>   anything.  Also try with a direct cable between host and target and
>   static IP addresses, to rule out any influence of the switch.  And
>   one final thing I can think of is that there is some netfilter rule
>   that disallows ping replies.
>

Thanks Arnout, I will do these experiments shortly.

-- 
woody
I can't go back to yesterday - because I was a different person then.
