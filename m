From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 Jul 2017 23:17:12 +0200
Subject: [Buildroot] [PATCH v3] package/qt5location: handle plugins
 being conditionally built
In-Reply-To: <49674504-df74-e429-b49f-eacf299ef15b@microchip.com>
References: <1500925803-3453-1-git-send-email-joshua.henderson@microchip.com>
 <20170725215220.6d447778@windsurf.home>
 <49674504-df74-e429-b49f-eacf299ef15b@microchip.com>
Message-ID: <619ea4cf-4911-7702-3c88-4e860ed15c85@mind.be>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net



On 28-07-17 18:31, Joshua Henderson wrote:
> Thomas, Peter,
> 
> On 07/25/2017 12:52 PM, Thomas Petazzoni wrote:
[snip]
>> Thanks, but Peter had sent an almost identical patch a few hours
>> before, and I've applied his patch.
> 
> It wasn't exactly identical.  The applied patch now causes a build failure for 5.6.2:

 If you noticed that Peter's patch was wrong, you could have mentioned it in the
commit message of your patch (below the --- line). Then Thomas might have seen
the difference and applied your patch instead.


>     qt5location 5.6.2 Patching
>     Applying 0001-Fix-plugins-build-dependency.patch using patch: 
>     patching file src/src.pro
>     Hunk #1 FAILED at 7.
>     Hunk #2 succeeded at 14 (offset -4 lines).
>     1 out of 2 hunks FAILED -- saving rejects to file src/src.pro.rej

 Care to send a fix (I guess just moving the patch to the right directory)?

 When you do, please also add a reference to the autobuilder failure:

http://autobuild.buildroot.net/results/676abe008c9c4bddfddd7b041d8db9999e9e899d

>>
>> Thanks a lot for all this work on Qt5, much appreciated! Note that we
>> still have a build failure of qt5webkit 5.6.1:
>>
>>   http://autobuild.buildroot.net/results/2f3/2f381967c82775ad911a246a9607034ef489c1ce/build-end.log
>>
> 
> I also have several other patches to rev (add qt5wayland and license hashes for all of qt5).

 For the qt5wayland patch, since you wrote yourself "This needs a v3 before
applying.", it's been marked as Changes Requested in patchwork so it won't be
applied and probably won't be reviewed either.

 Regards,
 Arnout

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
