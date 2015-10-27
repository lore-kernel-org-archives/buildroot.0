From: astrolite . <ciclonite@gmail.com>
Date: Tue, 27 Oct 2015 18:52:56 +0100
Subject: [Buildroot] Help Adding Package to build root..
Message-ID: <CACvocV4-o7u1L52xP7YnVTgoi369NUDk6vP4=ng6cLuwzXOvVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all sorry for my stupid question but i've a problem to adding a packages
to buid root..

I need to add a package called pigpio.
I've create a .tar.gz on github with all the file required.
The link is : https://github.com/ciclonite/pigpio


Here what happens:
gzip -d -c
/root/qt-dev/buildroot-qt-dev/buildroot-2015.05/dl/libpigpio-38.tar.gz |
tar --strip-components=1 -C
/root/qt-dev/buildroot-qt-dev/buildroot-2015.05/output/build/libpigpio-38
 -xf -
>>> libpigpio 38 Patching
>>> libpigpio 38 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find
/root/qt-dev/buildroot-qt-dev/buildroot-2015.05/output/build/libpigpio-38
-name $file); do cp support/gnuconfig/$file $i; done; done
>>> libpigpio 38 Configuring
>>> libpigpio 38 Autoreconfiguring
autoreconf: 'configure.ac' or 'configure.in' is required
Why the autoreconf cannot find configure.ac? in the tar.gz it's present!

I need a help..
Thanks a lot.
Giovanni
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151027/4b799d33/attachment.html>
