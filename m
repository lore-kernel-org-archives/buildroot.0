From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jan 2021 16:42:21 +0100
Subject: [Buildroot] Buildroot integration with eclipse issues
In-Reply-To: <CAJ2YAHtbmHSSW992Z4vX7F+SfBjraG-cSri04pcuEqOr6UADSQ@mail.gmail.com>
References: <CAJ2YAHtbmHSSW992Z4vX7F+SfBjraG-cSri04pcuEqOr6UADSQ@mail.gmail.com>
Message-ID: <20210128164221.3efb5d5b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alassane,

On Thu, 28 Jan 2021 12:00:22 +0100
Alassane <alassaneg@gmail.com> wrote:

> I've tried to use Eclipse to develop my own application for my embedded
> linux system but i'm having some issues.
> To use the buildroot eclipse plugin, eclipse luna 4.4 is needed. Then, to
> run this eclipse version, a java 7 JDK/JRE is needed. The problem is that
> it doesn't seem to be possible to install that old java JDK/JRE version
> (i'm using Ubuntu 18.04 on virtual box). I've tried to use java 11 JDK/JRE
> but then, an error is displayed in the terminal when i try to run eclipse
> luna 4.4 .
> So, i'd like to know if there was an alternative to that, like using a more
> recent version of eclipse that would be compatible with the buildroot
> eclipse plugin.

The Eclipse plugin is pretty much unmaintained, and therefore not
usable with recent Eclipse versions. Note that you can still use more
recent Eclipse versions, it's just that you will have to configure
Eclipse manually to point to the toolchain.

It's not related to Eclipse, but you can for example see
https://bootlin.com/blog/building-a-linux-system-for-the-stm32mp1-setting-up-a-qt5-application-development-environment/
which explains how we configured Qt Creator to use the toolchain
provided by Buildroot to build and debug applications.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
