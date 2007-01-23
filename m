From: Thilo Riessner <thilo@riessner.de>
Date: Tue, 23 Jan 2007 18:23:55 +0100
Subject: [Buildroot] chown to root does not work
In-Reply-To: <20070122203049.GC4981@aon.at>
References: <200701191331.07579.thilo@riessner.de>
	<20070122200253.GB4981@aon.at> <20070122203049.GC4981@aon.at>
Message-ID: <200701231823.55876.thilo@riessner.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Montag, 22. Januar 2007 21:30 schrieben Sie:
> On Mon, Jan 22, 2007 at 09:02:53PM +0100, Bernhard Fischer wrote:
> >On Mon, Jan 22, 2007 at 07:16:35PM +0100, Thilo Riessner wrote:
> >>Am Freitag, 19. Januar 2007 17:33 schrieben Sie:
> >>> On Fri, Jan 19, 2007 at 04:12:09PM +0100, Thilo Riessner wrote:
> >>> >Am Freitag, 19. Januar 2007 14:35 schrieb Goetz Bock:
> >>> >> On Fri, Jan 19 '07 at 13:31, Thilo Riessner wrote:
> >>> >> > In the docs is mentioned, that one doesn't need to be root to
> >>> >> > build a root filesystem. But when building the filesystem as a
> >>> >> > normal user, chown is not able to change owner to root in the
> >>> >> > target filesystem. Is there a solution of the problem, that I
> >>> >> > don't see?
> >>>
> >>> Who does call chown in there? Which package?
> >>> Please show me the logs around the alleged call to chown that is
> >>> failing.
>
> I've updated fakeroot, both the old version and the new one work for me.
> Please update, make dirclean && make and let me know if you still get
> this error..
No. Everything is fine now. Ready to start the first run with the new rootfs.
Thank's a lot for your help.

Thilo
