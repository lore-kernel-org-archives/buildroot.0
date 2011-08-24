From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 24 Aug 2011 17:38:21 +0000 (UTC)
Subject: [Buildroot] License for patches
References: <4E5517E0.30003@finalbit.de>
 <201108241205.23310.vapier@gentoo.org> <j33814$hoj$1@dough.gmane.org>
 <201108241313.13007.vapier@gentoo.org>
Message-ID: <j33cud$koj$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2011-08-24, Mike Frysinger <vapier@gentoo.org> wrote:
> On Wednesday, August 24, 2011 12:14:28 Grant Edwards wrote:
>> On 2011-08-24, Mike Frysinger <vapier@gentoo.org> wrote:
>>> On Wednesday, August 24, 2011 11:25:20 Lars Reemts wrote:
>>>
>>>> Which license is relevant for the package specific patches
>>>> distributed by buildroot? Formally it must be the GPL.
>>> 
>>> says who?  i dont see the logic here.
>> 
>> According to http://buildroot.uclibc.org/:
>> 
>>   Buildroot is a set of Makefiles and patches [....]
>> 
>>   Buildroot is [...] licensed under the GNU GENERAL PUBLIC LICENSE V2
>>   (Or later).
>> 
>> Seems pretty clear to me: the patches are under the GPL.
>
> pretty sure that wasnt generally the intention.

Possibly not, but I don't see any other reasonable interpretation of
the statement on the web page. There doesn't seem to be anything in
the buildroot tarball to indicate any licensing other than GPL v2 (a
copy of which is included in the tarball).

> the patches to packages should be under the same license as the
> packages they patch.

I agree that would make the most sense.

> the build system itself (the set of makefiles and such) are under the
> GPL.

-- 
Grant Edwards               grant.b.edwards        Yow! Is a tattoo real, like
                                  at               a curb or a battleship?
                              gmail.com            Or are we suffering in
                                                   Safeway?
