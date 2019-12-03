From: Jaafar Biyadi <jaafarbiyadi@gmail.com>
Date: Tue, 3 Dec 2019 15:51:23 +0100
Subject: [Buildroot] Missing PyQt5.QtQuick and PyQt5.QtQml on custom
 build Raspberry Pi 3
In-Reply-To: <20191203140929.3a27e2a5@windsurf>
References: <CACHEUn-YRb17+OqYfo09KpPyCitBP=4PyJDH_kgmkq0kXOnrqg@mail.gmail.com>
 <20191203140929.3a27e2a5@windsurf>
Message-ID: <CACHEUn_yPuWyV1AzEWhyJjWeL9hniOiJmHUuBmaLB8JEOwm38Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you very much for your email, I will check it out this evening.

Also I changed my email to jaafarbiyadi at gmail.com but this time I don't
receive any email after posting the issue. Maybe it worked.


Thanks anyway

Best regards

On Tue, Dec 3, 2019, 13:09 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Jaafar,
>
> On Tue, 3 Dec 2019 14:17:21 +0100
> Jaafar Biyadi <jaafarbiyadi@gmail.com> wrote:
>
> > Hello, I'm trying to build a system to run Python with PyQt5 using the
> > QtQuick and QtQml submodules, but I cannot figure what's wrong with my
> > config.
> >
> > I built all relevant package such as: Qt5 and Python-Qt5 and when running
> > the system and testing a .qml file with qmlscene, it works however the
> > QtQml & QtQuick modules are not found in python. What am I missing?
> >
> > My config (with external toolchain): https://pastebin.com/5g1GhJgF
> > Using buildroot-2019.11-rc3
>
> I think we have a bug report opened for this:
>
>   https://bugs.busybox.net/show_bug.cgi?id=12121
>
> And we have a proposal to fix it at:
>
>   http://patchwork.ozlabs.org/patch/1151846/
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191203/328b83b1/attachment.html>
