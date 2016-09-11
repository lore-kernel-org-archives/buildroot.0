From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Sep 2016 23:10:29 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/rpm: switch to version
 4.12.0.1
In-Reply-To: <20160911155431.6204c127@free-electrons.com>
References: <20160909163708.31980-1-james.knight@rockwellcollins.com>
 <20160911155431.6204c127@free-electrons.com>
Message-ID: <44f2d9ff-605a-f414-21df-e9d3eace0164@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-09-16 15:54, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri,  9 Sep 2016 12:37:08 -0400, James Knight wrote:
>> The provided switches from the RPM5 implementation to rpm.org's stream.
>>
>> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> 
> Could you give some details on why the rpm.org version is better than
> the rpm5.org version? The motivation to move from a 5.x version to
> a 4.x version doesn't look immediately obvious, so some more
> details would be good to have.

 v4 of the patch (about a year old) still had

The provided "bump" (suggested by Baruch Siach) switches from the rpm5
implementation to rpm.org's more active stream.

 It would be good to keep this information, and even add a link to [0]

[0] http://lists.buildroot.org/pipermail/buildroot/2015-August/137580.html

 I just checked on openhub, and indeed, rpm.org seems to get about 10 times more
commits than rpm5.org.

 Actually, there is a 4.13 release now, so James, perhaps you should use that one?


> RPM seems like a weird project, it's widely used, but it's very hard to
> understand what is the real upstream for it. This fact was even

 It looks pretty obvious to me: rpm5.org is a fork of rpm.org.

> discussed on LWN recently: https://lwn.net/Articles/196523/.

 Er, Thomas, you're by far not old enough to be allowed to call a 10 year old
article "recent" :-)

 Regards,
 Arnout

> 
> Thanks,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
