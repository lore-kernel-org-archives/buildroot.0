From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Thu, 15 Oct 2009 16:25:58 +0100
Subject: [Buildroot] Missing 'make install' option ?
In-Reply-To: <4AD6FCE0.6080005@gmail.com>
References: <4AD6ED89.6020902@mimc.co.uk> <1255601357.3933.4.camel@sven>
	<4AD6F907.6070106@mimc.co.uk> <4AD6FCE0.6080005@gmail.com>
Message-ID: <4AD73F06.8070106@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tike64 at gmail.com wrote:
> Mark Jackson wrote:
>> A sort of 'make install' which would:-
>>
>> (a) delete the output/target contents
>> (b) copy target_skeleton to output/target
>> (c) run 'make install' on all selected packages (re-compiling if
>> required)
>>
>> I'd find that *most* useful !!
> 
> I would also find it useful but, while we are waiting it, this might be
> of some value:
> 
> rm -rf output/build/.root output/target `find -name *target_installed`

Seems like a sledgehammer to crack a nut, and it still recompiles uclibc
*but* it's almost exactly what I was thinking about.

I'd still like a more formal approach to doing this, and I can't believe
that my requirements differ widely from most other developers !?!

Mark
