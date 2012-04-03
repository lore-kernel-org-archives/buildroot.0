From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Apr 2012 23:15:58 +0200
Subject: [Buildroot] FYI: Udev and systemd to merge
In-Reply-To: <20120403230247.576f307f@skate> (Thomas Petazzoni's message of
 "Tue, 3 Apr 2012 23:02:47 +0200")
References: <CAGm1_kucCZT97wq1JJfA4+NfGNrzvDm0V=sfLRvsW+vLF2_n+A@mail.gmail.com>
 <20120403230247.576f307f@skate>
Message-ID: <87wr5wv7n5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Yes, seen this. It isn't going to simplify our work. Both udev and
 Thomas> systemd are fairly complicated packages, so hearing that there are
 Thomas> going to be bundled together in the same source package is not a great
 Thomas> news.

 Thomas> Apparently, it will still be possible to build only udev, and keep a
 Thomas> non-systemd init. But still, it means a single source package that
 Thomas> actually contains two different binary packages. Not easy to handle
 Thomas> nicely in Buildroot.

I imagine systemd would just move to a sub option of udev, which would
add --with-systemd to the configure options or something like that, so
fairly limited impact.

-- 
Bye, Peter Korsgaard
