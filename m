From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Jan 2017 23:21:35 -0200
Subject: [Buildroot] Adding kmscube support
Message-ID: <CAOMZO5BDx6SqN-ZxU+ogJNetjtZhDqWrF0cB5YhqC7pW3NwaSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to build kmscube package so that I can test etnaviv from
mesa 17.0.0-rc1.

Here is the quick patch version for adding kmscube:
http://pastebin.com/MVz86aE6

After doing a make I get:

$ make
>>> kmscube be60c2f26fbc79038b246dc9a3b8b5fa2fa1fe54 Configuring
>>> kmscube be60c2f26fbc79038b246dc9a3b8b5fa2fa1fe54 Autoreconfiguring
aclocal: error: couldn't open directory 'm4': No such file or directory
autoreconf: /home/fabio/buildroot/output/host/usr/bin/aclocal failed
with exit status: 1

What is the correct way to fix this?

On the host PC it builds fine by doing:
./autogen.sh
./configure
make
sudo make install

Thanks!

Fabio Estevam
