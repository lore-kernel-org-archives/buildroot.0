From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sat, 08 Sep 2012 17:40:35 +0300
Subject: [Buildroot] Fixing linux-pam build failures
In-Reply-To: <CADiAo4KAOhh3DDxn+kPGoqrOOZx4iw9s2A6mdft2619ofhZHtw@mail.gmail.com>
References: <CADiAo4L2eUCF-2dEBWEJbw1V9z7uaQ-1=AA6z9SE4FA9v529+Q@mail.gmail.com>
 <504B2BD3.5080205@petroprogram.com>
 <CADiAo4KAOhh3DDxn+kPGoqrOOZx4iw9s2A6mdft2619ofhZHtw@mail.gmail.com>
Message-ID: <504B58E3.3070901@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dmitry

8.9.2012 15:54, Dmitry Golubovsky kirjoitti:
>
>> Your work for v86d ( http://patchwork.ozlabs.org/patch/157286/ )
>> is working wonderfully in my distro !
> Thanks for testing. The patchwork entry you mentioned also captures
> the discussion we had regarding non-standard use of C flags: the way
> Makefile is written in v86d does not capture them from the build
> environment, and they have to be pushed harder down via redefinition
> of $(CC) rather than via an environment variable.
>
> I thnk eventually I'll try to reintroduce the v86d patch: may I take
> your e-mail as a supporting vote? ;)
>
> Thanks.
>
Of course.
I will be glad to :)

Stefan
