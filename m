From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 16:48:16 +0100
Subject: [Buildroot] Help needed with cross-compiling libotr
In-Reply-To: <1907015096.10640.1362066181409.JavaMail.root@openwide.fr>
References: <CAG2jQ8jiP6g7Fuhy_H3CgocC8CAMbT9ZF1sX22tsdOmyjhgsaQ@mail.gmail.com>
 <1907015096.10640.1362066181409.JavaMail.root@openwide.fr>
Message-ID: <20130228164816.4b62ebad@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

Could you please avoid top-posting, and use a decent mailer than wraps
line properly? Thanks!

On Thu, 28 Feb 2013 16:43:01 +0100 (CET), Jeremy Rosen wrote:

> I am torn on that one... the frontier between embedded and not
> embedded never was very clear, and there are lots of single-purpose
> computers that have a screen and a keyboard to run a single graphical
> app. 
> 
> I don't know the exact project here, but having a small screen
> displaying messages and implementing it with pidgin... that wouldn't
> have been my technical choice but why not...
> 
> my point is that there are lots of "obviously desktop" apps that are
> sometime used in the embedded world without pulling in the whole
> infrastructure, so in a way it makes sense to have them in buildroot.

Agreed. But what Stefan is doing is really a general-purpose
distribution, he already told about his global project on the list in
the past. So not only Pidgin is going to be packaged, but maybe also
Abiword, Firefox, and why not LibreOffice?

> the reason not to is unmaintained packages, but is it really a
> problem ? most mail we get about broken packages are fixes, not
> complaints, so I am not sure this is a problem...

To me, it is a problem. Many unmaintained packages means stuff that
will maybe no longer build, giving a bad feeling about Buildroot's
quality for newcomers. And if they still build thanks to our
autobuilders and the work we do to fix the build issues, they will
probably remain at very old versions, also giving a bad impression to
new users or potential users evaluating Buildroot.

I think we managed to keep the focus on the infrastructure (don't
generate binary packages, don't try to be too smart to guess what needs
to be rebuilt, etc.), and we also should be thinking of keeping the
focus in terms of packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
