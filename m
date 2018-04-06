From: Patrick Doyle <wpdster@gmail.com>
Date: Fri, 6 Apr 2018 10:44:24 -0400
Subject: [Buildroot] Using a bootlin toolchain with buildroot
Message-ID: <CAF_dkJBJAouapTOfS-MEo-cLNHb1birJ74dvChGPgfVG=i6guw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Are there any tips or tricks to using a bootlin toolchain with
buildroot(.2018.02)?

I have downloaded armv7-eabihf--musl--stable-2018.02-2.tar.bz2
unpacket it into /opt.
I have selected BR2_TOOLCHAIN_EXTERNAL
I have selected BR2_TOOLCHAIN_EXTERNAL_CUSTOM
I have selected BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED
I have specified /opt/armv7-eabihf--musl--stable-2018.02-2/bin for
BR2_TOOLCHAIN_EXTERNAL_PATH

I could keep listing all of these settings, but I'm not sure how
useful that would be.

Basically, I'm asking: If I want to use a bootline toolchain, do I
just go through and choose the options that best seem to match the
toolchain options, or is there more documentation about doing this
someplace?

I don't know that I have run into any problems choosing the options
myself, but it would be nice not to have to reinvent any wheels.

(Oh yeah, something just failed in my build... but I'll dig into that
myself before I waste your time asking about it.)

--wpd
