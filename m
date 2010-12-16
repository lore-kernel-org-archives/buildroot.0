From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Dec 2010 16:07:32 -0300
Subject: [Buildroot] [PATCH] oprofile: Don't install binutils in the
 target filesystem.
In-Reply-To: <AANLkTinH_c3ZogANv0ataL_9R6G+zwa8B29cf4TezLmm@mail.gmail.com>
References: <AANLkTi=qoF_Xq8jNoieWCAQCGR-5VzQaYZV85EO3KfYz@mail.gmail.com>	<AANLkTinDHGaCtW+uA5b=ndfoMFORb4QH0J811zSops7f@mail.gmail.com>	<20101207195818.596738ce@surf>
	<AANLkTinH_c3ZogANv0ataL_9R6G+zwa8B29cf4TezLmm@mail.gmail.com>
Message-ID: <4D0A6374.9060109@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/07/10 16:27, Will Newton wrote:

> On Tue, Dec 7, 2010 at 6:58 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Gustavo Zacarias is cleaning up the binutils package, so I'm sure he
>> will take care of this as well :-)
> 
> That's good news, thanks for letting me know!
> 
> Gustavo: If you need any patches testing I'll be happy to do it.

git://repo.or.cz/buildroot-gz.git toolchain-work
or
http://repo.or.cz/w/buildroot-gz.git/shortlog/refs/heads/toolchain-rework :-)
Give it a spin, i've done basic tests for an ARM target.
Regards.
