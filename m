From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 16 Mar 2010 21:39:06 +0000 (UTC)
Subject: [Buildroot] make distclean leaves ~200 files under
	package/config/
References: <hnoqma$lhv$1@dough.gmane.org> <20100316223047.44094042@surf>
Message-ID: <hnotpq$1pr$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-03-16, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> On Tue, 16 Mar 2010 20:46:02 +0000 (UTC)
> Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> After doing a "make distclean", there a couple hundred files under
>> package/config that seeming shouldn't be there:
[...]
>> Shouldn't "make distclean" get rid of those?
>
> In fact, those should be moved somewhere into the $(O) directory
> (output/ by default).

Ah, I see find that a patch has already been submitted:

  https://bugs.uclibc.org/show_bug.cgi?id=1213

I thought I remembered this having been discussed before, but I didn't
search for the right words the first time I looked...
  
-- 
Grant Edwards               grant.b.edwards        Yow! Will it improve my
                                  at               CASH FLOW?
                              gmail.com            
