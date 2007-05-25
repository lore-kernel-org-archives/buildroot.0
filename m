From: Tom <fivemiletom@gmail.com>
Date: Fri, 25 May 2007 13:59:06 -0700
Subject: [Buildroot] Package selection question
In-Reply-To: <20070525200333.GT24585@aon.at>
References: <4656F77D.30303@teamboyce.co.uk> <465737B9.8070008@gmail.com>
	<20070525200333.GT24585@aon.at>
Message-ID: <46574E1A.7020705@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks.

I am working to isolate and find a workaround to my mpfr problem on 
cygwin. Once I do, I will post the results of all workarounds I had to 
do (or the error log should I not get it done). In a separate thread as 
requested.

Bernhard Fischer wrote:
> On Fri, May 25, 2007 at 12:23:37PM -0700, Tom wrote:
>> Hello,
>>
>> I just want to build the toolchain and the debugger on host: cygwin, 
>> target: arm.
>>
>> So, even after I unchecked busybox and all packages, it still builds gmp 
>> (and, unsuccessfully, mpfr). Why does it need it please and why is this 
>> an option then? Or am I doing something wrong here?
> 
> gcc uses gmp/mpfr, you're doing nothing wrong. Please report build
> failures of gmp/mpfr to the respective lists.
> 
> Before you report it to the mpfr folks, please paste the error here,
> since i suspect that it could have to do something with the
> binary/library name extensions, which (IIRC) we currently do not handle
> at all (there's a bug somewhere about this, if memory serves me right).
> 
