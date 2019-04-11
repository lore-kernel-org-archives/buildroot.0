From: Steinhilber, Markus <Markus.Steinhilber@erbe-med.com>
Date: Thu, 11 Apr 2019 10:01:53 +0000
Subject: [Buildroot] Wrong license information in package
 qt5quickcontrols2?
In-Reply-To: <d6920a5b-217c-8dd6-3d0e-f4b163ad2e17@mind.be>
References: <017c92fcfda14fe3b07c0dcc70bbaf5e@erbe-med.com>
 <d6920a5b-217c-8dd6-3d0e-f4b163ad2e17@mind.be>
Message-ID: <64d306ea9d0a4e84ac0a1ef387fde33c@erbe-med.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Arnout Vandecappelle [mailto:arnout at mind.be]
>
>  Note that the docs should only be mentioned if they are in fact installed on
> the target. I'm not sure if that is the case here. Anyway, that's a separate
> issue and in general we're not very consistent in that.

I looked into that. I can't find any documentation that is copied to the target - normally. However I think
you could use a build parameter to build and install the examples and these are licensed under FDL. I don't
know what's the 'buildroot' way to do in such case. I think it might be better to list an unnecessary license than
to miss one.

>
>  Oh and I also checked that both 5.6 and 5.12 have the same license - that's not
> always the case either.
>
>  So, feel free to send a patch to fix this!

I wanted to. But then I found out that 5.6.3 does not include a GPLv2 license file, although in the source files they
have GPLv2 in the headers. Is it Ok, to mention that it's GPLv2 without supplying an actual license file for it?
It's not very good, but I think it's better than to show the wrong license.

I think the reason this is the way it is, is because qtquickcontrols2 was officially only introduced in Qt 5.7.
In the 5.6 docs there is no info on them. Also the current docs say "The module was introduced in Qt 5.7."

Regards,
Markus Steinhilber
________________________________

Erbe Elektromedizin GmbH Firmensitz: 72072 Tuebingen Geschaeftsfuehrer: Christian O. Erbe, Reiner Thede Registergericht: Stuttgart HRB 380137
