From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 Feb 2015 13:34:57 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-02-22
In-Reply-To: <20150223122336.2de88dc7@free-electrons.com>
References: <20150223073016.4059D1027D4@stock.ovh.net>	<54EAFCAA.5070506@imgtec.com>
 <20150223122336.2de88dc7@free-electrons.com>
Message-ID: <54EB1E71.5030904@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 23/02/15 12:23, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Mon, 23 Feb 2015 11:10:50 +0100, Vicente Olivert Riera wrote:
> 
>> I can't reproduce this, but I think it could be caused by a parallel
>> build issue. The same happened in mesa:
>>
>> https://bugs.freedesktop.org/show_bug.cgi?id=83355
> 
> And apparently, they have a proposed fix for it. Maybe we could see if
> a similar fix could be done for openswan ?

Yes, that was fixes 6 months ago by this commit:

https://gitlab.com/bminor/mesa-mesa/commit/5a4e0f3873657d874eb5ff52819f42ea38d54b91.patch

We could do a similar fix for openswan. The problem is I can't reproduce
the failure so I wouldn't be able to test that fix to check if it works
or not.

Regards,
--
Vincent
