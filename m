From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Feb 2017 10:22:55 -0300
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <20170214142725.1b9e98ae@free-electrons.com>
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
Message-ID: <b1f43e289a502d88bcb7f341bd6a629f@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-02-14 10:27, Thomas Petazzoni wrote:

>>          arm |                libepoxy-v1.3.1 | NOK | 
>> http://autobuild.buildroot.net/results/3912eaa022865ce81535fbb72a206577e32b506f
>>          arm |                libepoxy-v1.3.1 | NOK | 
>> http://autobuild.buildroot.net/results/1e09ab626e3ecdd0467842b81200d96073af66e6
>>          arm |                libepoxy-v1.3.1 | NOK | 
>> http://autobuild.buildroot.net/results/e2408c887dde0ad9f7120d2ab3e267da84c16484
>>          arm |                libepoxy-v1.3.1 | NOK | 
>> http://autobuild.buildroot.net/results/7f2cdfbc125292de2427d16f9ae0b5ad971a24c2
> 
> error: conflicting types for 'khronos_ssize_t'
> 
> Gustavo, could you have a look ?

Hi.
Ugh, yet another problematic GL provider (odroid-mali), it's likely 
related to some versions of khronos GL being, well, problematic, since i 
faced the same problem with newer versions of webkitgtk for example.
I wonder if we should go the extra mile in patching this minor 
nuissances since it's unlikely to get fixed upstream for these cases.

Regards.
