From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Feb 2014 17:58:03 +0100
Subject: [Buildroot] Analysis of VLC build failures
In-Reply-To: <CAHt8ZCO3fhuv__zQweidJb=2TSBdC0M27P487=AOx1+780cm2g@mail.gmail.com>
References: <20140223073009.3676E101056@stock.ovh.net>	<20140223110021.16b6b976@skate>	<530C4314.4000203@mind.be>
 <CAHt8ZCO3fhuv__zQweidJb=2TSBdC0M27P487=AOx1+780cm2g@mail.gmail.com>
Message-ID: <530CCB9B.2000101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/02/14 16:17, Simon Dawson wrote:
> On 25 February 2014 07:15, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  My feeling is that vlc is currently not in a state that we can release
>> it. I have no issue with including some package that doesn't work very
>> well in a release, but for a flagship package like vlc I think it's
>> important that we really get it right. And currently we don't.
> 
> When I (re-)added this package, I had hoped to have more time to spend
> on getting it working properly. (As it happens, the project for which
> I needed vlc has now been abandoned.)
> 
> I tend to agree that this is a potentially "high profile" package, and
> that it ought perhaps to be dropped from the 2014.02 release.

 I would also be OK with adding a comment to the VLC config option that
warns the users that it is not working very well.

 I can send a patch if needed.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
