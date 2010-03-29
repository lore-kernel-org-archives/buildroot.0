From: Muhammed ER <er.muhammed@gmail.com>
Date: Mon, 29 Mar 2010 22:36:13 +0300
Subject: [Buildroot] Qt Phonon GStreamer
Message-ID: <f70863321003291236l217efdc0r3a644dcafdae51a5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
For last week, I try to solve this problem,

WARNING: bool Phonon::FactoryPrivate::
createBackend() phonon backend plugin could not be loaded
WARNING: bool Phonon::FactoryPrivate::createBackend() phonon backend plugin
could not be loaded
WARNING: bool Phonon::FactoryPrivate::createBackend() phonon backend plugin
could not be loaded
WARNING: bool Phonon::FactoryPrivate::createBackend() phonon backend plugin
could not be loaded
WARNING: bool Phonon::FactoryPrivate::createBackend() phonon backend plugin
could not be loaded
WARNING: Phonon::createPath: Cannot connect  Phonon::MediaObject ( no
objectName ) to  Phonon::AudioOutput ( no objectName ).
WARNING: bool Phonon::FactoryPrivate::createBackend() phonon backend plugin
could not be loaded
WARNING: Phonon::createPath: Cannot connect  Phonon::MediaObject ( no
objectName ) to  Phonon::VideoWidget ( no objectName ).
WARNING: bool Phonon::FactoryPrivate::createBackend() phonon backend plugin
could not be loaded
WARNING: bool Phonon::FactoryPrivate::createBackend() phonon backend plugin
could not be loaded

But I did not solve it.

I used, buildroot and add Qt, phonon, gstreamer (base and good).

What is need in buildroot that I should add to my compilation.

Thanks,
Muhammed ER.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100329/92329162/attachment.htm>
