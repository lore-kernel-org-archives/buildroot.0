From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Thu, 22 Jul 2010 03:52:36 +0200
Subject: [Buildroot] AVR32 is broken (toolchain)
In-Reply-To: <AANLkTinBXtX-xDYtM5V8pTrwNpkDKBHSpz9MKnQ8mypa@mail.gmail.com>
References: <AANLkTinBXtX-xDYtM5V8pTrwNpkDKBHSpz9MKnQ8mypa@mail.gmail.com>
Message-ID: <201007220352.37255.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Donnerstag 22 Juli 2010 00:02:31 schrieb Thiago A. Corr?a:
> Hi,
> 
>      I was able to track it down to this commit:
> 8e8103bfb55a814d68eabb51afebfb35c3e7cec8
>      The toolchain builds right before it, but doesn't after.
>      I'm trying to figure it out, but I'm not very experienced with
> the toolchain build or git, so it's taking me quite a while. Perhaps
> someone with more experience could take a look at the issue?
> 
>      It's reproductible with make atngw100_defconfig
> 
> Kind Regards,
>      Thiago A. Correa


Hi,

thanks for reporting this issue.
I'll have a look into it - currently the code still compiles :)

Meanwhile, maybe you could post the results of the build, i.e. the build 
failure / error messages here, or use a pasting service like 
http://dpaste.com/ and then post the link here.

Thanks,
Peter
