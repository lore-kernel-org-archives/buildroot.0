From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 24 Jan 2007 00:14:07 +0100
Subject: [Buildroot] chown to root does not work
In-Reply-To: <200701232320.34740.claus.klein@arcormail.de>
References: <200701191331.07579.thilo@riessner.de>
	<20070122200253.GB4981@aon.at> <20070122203049.GC4981@aon.at>
	<200701232320.34740.claus.klein@arcormail.de>
Message-ID: <20070123231407.GM23354@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 23, 2007 at 11:20:34PM +0100, Claus Klein wrote:
>On Monday 22 January 2007 21:30, Bernhard Fischer wrote:
>> On Mon, Jan 22, 2007 at 09:02:53PM +0100, Bernhard Fischer wrote:
>> >On Mon, Jan 22, 2007 at 07:16:35PM +0100, Thilo Riessner wrote:
>> >>Am Freitag, 19. Januar 2007 17:33 schrieben Sie:
>> >>> On Fri, Jan 19, 2007 at 04:12:09PM +0100, Thilo Riessner wrote:
>> >>> >Am Freitag, 19. Januar 2007 14:35 schrieb Goetz Bock:
>> >>> >> On Fri, Jan 19 '07 at 13:31, Thilo Riessner wrote:
>> >>> >> > In the docs is mentioned, that one doesn't need to be root to build a
>> >>> >> > root filesystem. But when building the filesystem as a normal user,
>> >>> >> > chown is not able to change owner to root in the target filesystem. Is
>> >>> >> > there a solution of the problem, that I don't see?
>> >>>
>> >>> Who does call chown in there? Which package?
>> >>> Please show me the logs around the alleged call to chown that is
>> >>> failing.
>> 
>> I've updated fakeroot, both the old version and the new one work for me.
>> Please update, make dirclean && make and let me know if you still get
>> this error..
>
>it works, but there are still the error messges?

Please report this against your distro and/or against fakeroot if your
distro fails to fix this.

PS: Works for me
PPS: please provide a patch that fixes this for you if you think
fakeroot is in error.

thanks for your understanding..
