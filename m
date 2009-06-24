From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 24 Jun 2009 14:50:54 +0000 (UTC)
Subject: [Buildroot] How to get symbolic debugging to work?
References: <h1p5br$11r$1@ger.gmane.org> <h1r69p$kd5$1@ger.gmane.org>
	<1245830343.3872.9.camel@sven> <20090624091656.GD22116@mx.loc>
Message-ID: <h1tege$k62$2@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-06-24, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> wrote:
> On Wed, Jun 24, 2009 at 09:59:03AM +0200, Sven Neumann wrote:

>>> Gdb 6.8 just plain doesn't work for ARM targets.
>>> 
>>> I switched to 6.7.1, and it works fine (including debugging
>>> multiple threaded apps).
>>
>>We also have problems with gdb 6.8 on the ARM. Or in other
>>words, it just plain does not work. I will now follow your
>>advice and switch to version 6.7.1. If that actually helps,
>>then buildroot should probably select that version when
>>building for an ARM target (similar as what is done currently
>>for AVR32).
>
> Alternatively you could check if it works OK with the current
> gdb and file a bug either against 6.8 with or CVS

I'll probably not get around to trying the CVS gdb, so I filed
a bug against 6.8:

  http://sourceware.org/bugzilla/show_bug.cgi?id=10328

If somebody does try out CVS, please add the results to the bug
above.  It might also be useful to know if the same problems
occur when using glibc instead of uclibc, but this is probably
the wrong place to ask for data from glibc users. :)

-- 
Grant Edwards                   grante             Yow! Am I SHOPLIFTING?
                                  at               
                               visi.com            
