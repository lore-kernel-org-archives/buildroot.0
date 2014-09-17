From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 17:15:03 -0300
Subject: [Buildroot] [PATCH 03/11] iptables: add hash
In-Reply-To: <20140917201220.GD4056@free.fr>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
 <1410963609-18128-3-git-send-email-gustavo@zacarias.com.ar>
 <20140917201220.GD4056@free.fr>
Message-ID: <5419EBC7.9060700@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/17/2014 05:12 PM, Yann E. MORIN wrote:

> Gustavo, All,
> 
> On 2014-09-17 11:20 -0300, Gustavo Zacarias spake thusly:
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> There is also a sha1sum available:
>     ftp://ftp.netfilter.org/pub/iptables/iptables-1.4.21.tar.bz2.sha1sum
> 
> Since md5 is really so 20th century, it'd be good to use a stronger
> hash, especially since upstream provides it.
> 
> Regards,
> Yann E. MORIN.

I regret to inform you that SHA-1 is pretty much 20th century as well :)
But yeah, two sucky hashes are better than one.
Regards.
