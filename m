From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Aug 2018 17:34:28 +0200
Subject: [Buildroot] [2/2] package/glibc: bump to version 2.28
In-Reply-To: <87wosra1an.fsf@dell.be.48ers.dk>
References: <20180803181425.18106-2-romain.naour@gmail.com>
 <87tvnwnoc6.fsf@tkos.co.il> <20180815134041.74b55316@windsurf>
 <87wosra1an.fsf@dell.be.48ers.dk>
Message-ID: <c917ff05-bc4f-1912-235c-07b5a993ce27@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, Peter,

Le 15/08/2018 ? 21:16, Peter Korsgaard a ?crit?:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> 
>  > Hello,
>  > On Wed, 15 Aug 2018 09:19:53 +0300, Baruch Siach wrote:
> 
>  >> Romain Naour writes:
>  >> > https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html  
>  >> 
>  >> This announcement says:
>  >> 
>  >> GNU make 4.0 or later is now required to build glibc.
>  >> 
>  >> autobuilders now show that:
>  >> 
>  >> http://autobuild.buildroot.net/?reason=glibc-glibc-2.28
>  >> 
>  >> Since glibc is a fundamental package, does that mean we need to bump the
>  >> make version requirement to 4.0 (current requirement is 3.81)? Maybe
>  >> build host-make on older hosts?
> 
>  > Building host-make on machines that don't have make >= 4.0 sounds like
>  > a good approach to me. And of course, we only do this as a dependency
>  > of glibc.
> 
> Agreed, it is imho too early to require make >= 4.0 globally.
> 

Thanks Baruch for noticing this new dependency added by [1].

I'll take a look how to do this.

Best regards,
Romain

[1]
https://sourceware.org/git/?p=glibc.git;a=commit;h=f2873d2da0ac9802e0b570e8e0b9e7e04a82bf55
