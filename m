From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 11:30:47 +0200
Subject: [Buildroot] Qt 5.9.1 QML arm crash | QTBUG-61522
In-Reply-To: <CAKdiq5_FDrJNp8OXw3pQ5cByeBZXzg4WQ_qH3nk+HhrcpZEZfw@mail.gmail.com>
References: <CAKdiq5_FDrJNp8OXw3pQ5cByeBZXzg4WQ_qH3nk+HhrcpZEZfw@mail.gmail.com>
Message-ID: <20170731113047.3e8c710c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Jul 2017 10:28:58 +0200, Petar Koretic wrote:

> So I've tested Qt 5.9.1 from the master branch with Raspberry Pi 3 stock
> build using glibc.
> Unfortunately it is hit by a big QML bug that results in a crash when doing
> a simple thing as
> 
> var x = {}
> 
> This is reported and will be fixed in 5.9.2
> https://bugreports.qt.io/browse/QTBUG-61522.
> 
> I have tested the patch with buildroot and it does work correctly after that.
> Would you be interested now in adding the patch until 5.9.2 is
> released or will you be waiting for 5.9.2?

We are interested in adding the patch. Especially since we are about to
tag Buildroot 2017.08-rc1, and we will no longer be accepting version
bumps. So we definitely want Qt 5.9.1 to work.

So if you can send a Buildroot patch that adds the Qt5 fix, that would
be nice. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
