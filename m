From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Apr 2017 23:21:16 +0200
Subject: [Buildroot] [PATCH 1/1] automake: add patch fixing GNU bug
	#25299
In-Reply-To: <20170414224341.19521688@free-electrons.com>
References: <1491568417-5355-1-git-send-email-heiko.thiery@gmail.com>
 <CAEyMn7YddOxBVShv7WvEcMLCL-rJL_CdJp7d0R0NU0=ZYVwrKA@mail.gmail.com>
 <fb021600-fec9-11e8-b7e3-03b660e975b8@mind.be>
 <20170414224341.19521688@free-electrons.com>
Message-ID: <4cc73d2b-05bf-fbbf-75bd-81cefb661e6e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-04-17 22:43, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 10 Apr 2017 16:10:06 +0200, Arnout Vandecappelle wrote:
> 
>>  And it would also help if you could give a list of autoreconf'ed packages that
>> you have tested with this patch.
> 
> I thought I had given feedback on this patch, but apparently no. One
> think that isn't clear to me is what packages are affected:
> 
>  * Are only packages autoreconf'ed by Buildroot affected by the @
>    issue ?
> 
>  * Or are all autotools packages affected ? If that's the case, then
>    this patch is not sufficient: we would have to autoreconf all
>    autotools packages, but is not really doable.

 I've tried it, and apparently only autoreconf'ed packages are the problem.
That's why I wrote that the commit message should clarify exactly this.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
