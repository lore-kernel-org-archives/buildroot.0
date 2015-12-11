From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Dec 2015 15:36:27 +0000
Subject: [Buildroot] [PATCH 3/3] package/boost: add library coroutine2
In-Reply-To: <20151211163013.1c10a143@free-electrons.com>
References: <1449842279-22712-1-git-send-email-joerg.krause@embedded.rocks>
 <1449842279-22712-3-git-send-email-joerg.krause@embedded.rocks>
 <566AE6EA.9040005@imgtec.com> <20151211163013.1c10a143@free-electrons.com>
Message-ID: <566AED7B.3060206@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 11/12/15 15:30, Thomas Petazzoni wrote:
> Vicente,
> 
> On Fri, 11 Dec 2015 15:08:26 +0000, Vicente Olivert Riera wrote:
> 
>> I was trying to test your patch and I have noticed that despite of
>> having coroutine2 selected...
>>
>> BR2_PACKAGE_BOOST_COROUTINE2=y
>>
>> ...there isn't any libboost_coroutine2.so file installed on target. Is
>> that normal?
> 
> The vast majority of Boost "libraries" are not libraries in the .so
> sense, but purely header based libraries, i.e just a bunch of .h with
> very complicated C++ code.

But there is a libboost_coroutine.so library, that's why I asked. Is it
expected to have a lib for coroutine and not for coroutine2? That's my
doubt.

Regards,

Vincent.

> 
> Thomas
> 
