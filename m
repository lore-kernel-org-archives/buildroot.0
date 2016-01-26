From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Jan 2016 22:25:11 +0100
Subject: [Buildroot] musl/gettext issue
References: <20150916221636.039df52b@free-electrons.com>
Message-ID: <nq4lncxo36.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 16 Sep 2015 22:16:36 +0200 schrieb Thomas Petazzoni:

> Now, enter musl. It does have an internal gettext implementation.
> However, it is not recognized by GNU gettext has a correct
> implementation, so when you build GNU gettext in a musl system, it does
> build/install libintl.so and its header files.

Hi Thomas,

is there already a solution for this problem?
I saw the bug with aumix-2.8 which I could solve by bumping the package 
to 2.9.1. Now I am stuck with http://autobuild.buildroot.net/?reason=gdk-
pixbuf-2.32.3

Is this bug report related to our problem?
http://savannah.gnu.org/bugs/?46436

Regards, Bernd
