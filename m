From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 09:09:04 +0100
Subject: [Buildroot] [PATCH v1] package/wpewebkit: fix compile without
 video support
In-Reply-To: <20201113235046.GB184214@momiji> (Adrian Perez de Castro's
 message of "Fri, 13 Nov 2020 23:50:46 +0200")
References: <20201110221629.7011-1-ps.report@gmx.net>
 <87sg9ei86d.fsf@dell.be.48ers.dk> <20201112223734.007ff25d@gmx.net>
 <20201113235046.GB184214@momiji>
Message-ID: <87ima8cqcf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

Hi,

 >> Patch seems upstream already superseded by [1] 'Remove remaining alternative
 >> preference setting mechanisms from LayoutTests' (removing the code)...

 > I looked a bit into backporting this patch (and a few dependent ones) into the
 > stable release branch and it got complicated quickly. I think that it may be
 > better to have the fix that just uses the ENABLE(VIDEO) guards merged in the
 > release branch.

 > I have just created an issue in WebKit's Bugzilla:

 >   https://bugs.webkit.org/show_bug.cgi?id=218921

Thanks!

 > and I will have a fix done which will be included in version 2.30.3, which
 > is to be released soon and will also include security fixes. Maybe we would
 > prefer to wait until that version is released and update Buildroot to it
 > before ending the release candidate period. WDYT?

I normally only cut the final release at the very end of the month /
early December, so if "soon" is before that, it should be fine.

-- 
Bye, Peter Korsgaard
