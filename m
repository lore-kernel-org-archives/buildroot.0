From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 7 Feb 2013 18:06:05 +0100
Subject: [Buildroot] [PATCH v2 2/5] docs/manual: mention the new
 post-image mechanism
In-Reply-To: <20130207154948.59736956@skate>
References: <1360187346-30258-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1360187346-30258-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMM+DVbQp1370_mqt9QbU=TVGEneuwbN7XdTE-XTkLm8BLQ@mail.gmail.com>
 <20130207154948.59736956@skate>
Message-ID: <CAHXCMMLc4ihR2nxHRpe5eRriMPMMqkd7RjB4O5rezyXUniRKWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

2013/2/7 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
[...]
> I am not sure what you would like to see added exactly. Since they are
> executed outside of fakeroot, then they are just executed after the
> filesystem images are created, and that's it, no?
>
> Of course, if those scripts were executed inside fakeroot, it should be
> mentioned clearly. But since it's not the case, is it important to
> mention that they are executed outside of fakeroot? We could give a lot
> of things that those scripts do /not/ do, no? My feeling is that it
> would add confusion, but I don't have a strong feeling about this.
>
> Or maybe you were thinking about something else than just "These
> scripts are executed outside of the fakeroot environment" ?

My point is that these scripts will most likely try to do things that
requires root permissions;
so it may be good to warn the user that this should be handled by the
scripts themselves.

Regards,

-- 
Samuel
