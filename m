From: Adam Nielsen <a.nielsen@shikadi.net>
Date: Fri, 26 Apr 2013 09:13:35 +1000
Subject: [Buildroot] buildroot still compiles C++ code when C++ compiler
	is unavailable
In-Reply-To: <20130425153128.71c7c44f@skate>
References: <klacea$3sl$1@ger.gmane.org> <20130425153128.71c7c44f@skate>
Message-ID: <klcdas$3s8$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Many thanks for your reply!

>> checking whether to build shared libraries... yes
>> checking whether to build static libraries... yes
>> checking how to run the C++ preprocessor... /lib/cpp
>> configure: error: in
>> `buildroot/build/gettext-0.18.2.1/gettext-runtime/libasprintf':
>> configure: error: C++ preprocessor "/lib/cpp" fails sanity check
>> See `config.log' for more details
>> configure: error: ./configure failed for libasprintf
>> configure: error: ./configure failed for gettext-runtime
>
> However, did you do a complete 'make clean; make' cycle after disabling
> C++ support? Buildroot doesn't track the configuration changes you're
> making, so when you make a change as big in consequences as disabling
> C++, you should do a complete rebuild.

Ahh ok, well that makes more sense, but yes, I did do a 'make clean' as part 
of trying to solve the problem.  I have just done it again to make absolutely 
sure, and I'm still getting the same error.

I've uploaded my .config here if it will help:

   http://www.shikadi.net/files/buildroot/2013-04-26.gettext_cpp_fails.config

Let me know if you can figure out what I have done wrong!

Thanks again,
Adam.
