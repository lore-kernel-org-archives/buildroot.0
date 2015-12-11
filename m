From: Andreas Ehmanns <universeii@gmx.de>
Date: Fri, 11 Dec 2015 07:04:12 +0100
Subject: [Buildroot] Can I built from two sources in one package?
In-Reply-To: <20151210201854.GD3597@free.fr>
References: <5669D552.6020704@gmx.de> <20151210201854.GD3597@free.fr>
Message-ID: <566A675C.9040509@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 10.12.2015 um 21:18 schrieb Yann E. MORIN:
> Andreas, All,
>
> On 2015-12-10 20:41 +0100, Andreas Ehmanns spake thusly:
>> actually buildroot supports RADIUS with a client package but not a server
>> package. I want to add the server but I'm not sure if I can add this to the
>> existing client package or if I should create a complete new package.
>> Client and Server are available in different tar.gz files from the official
>> RADIUS site so I think it is better to have different packages for client
>> and server. Am I wrong?
> If they are indeed two different source tarballs, then make them two
> different packages in Buildrot, indeed.
>
> Regards,
> Yann E. MORIN.
>

Yann,
thanks for your answer. I will prepare an extra package for the RADIUS 
server and submit it as soon as it is tested.

Regards,
Andreas
