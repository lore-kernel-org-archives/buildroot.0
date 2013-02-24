From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sun, 24 Feb 2013 13:14:31 +0200
Subject: [Buildroot] [PATCH] polkit: bump to version 0.104
In-Reply-To: <20130224043730.04cb6369@skate>
References: <1361468671-9589-1-git-send-email-stefan.froberg@petroprogram.com>
 <20130224043730.04cb6369@skate>
Message-ID: <5129F617.2000207@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas

24.2.2013 5:37, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Thu, 21 Feb 2013 19:44:31 +0200, Stefan Fr?berg wrote:
>
>>  package/polkit/polkit-0.104-uclibc-netgroup.patch |   41 +++++++++++++++++++++
> We no longer want to have the version in the patch file names. So it
> should be "polkit-uclibc-netgroup.patch".
>
> Best regards,
>
> Thomas

Ok.
I think I will wait that patch download mechanisms and just point it to
that
http://repository.timesys.com/buildsources/p/polkit/polkit-0.104/polkit-0.104-uclibc-netgroup.patch
in next update.


BTW, I have a question about two of those configure switches I added to
this patch and have been bugging me:

1 )

This is ok right?

--localstatedir=/var

I mean, without this switch I have seen some packages to install some
crazy location like /usr/var

2 )

Witch would be more correct ?

--libexecdir=/usr/lib/polkit-1

or

--libexecdir=/usr/libexec/polkit-1

?
What does the standards say about this ?

Regards
Stefan
