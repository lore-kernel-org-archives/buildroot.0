From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 22 Jan 2007 21:02:53 +0100
Subject: [Buildroot] chown to root does not work
In-Reply-To: <200701221916.36228.thilo@riessner.de>
References: <200701191331.07579.thilo@riessner.de>
	<200701191612.12016.thilo@riessner.de>
	<20070119163313.GA17320@aon.at>
	<200701221916.36228.thilo@riessner.de>
Message-ID: <20070122200253.GB4981@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 22, 2007 at 07:16:35PM +0100, Thilo Riessner wrote:
>Am Freitag, 19. Januar 2007 17:33 schrieben Sie:
>> On Fri, Jan 19, 2007 at 04:12:09PM +0100, Thilo Riessner wrote:
>> >Am Freitag, 19. Januar 2007 14:35 schrieb Goetz Bock:
>> >> On Fri, Jan 19 '07 at 13:31, Thilo Riessner wrote:
>> >> > In the docs is mentioned, that one doesn't need to be root to build a
>> >> > root filesystem. But when building the filesystem as a normal user,
>> >> > chown is not able to change owner to root in the target filesystem. Is
>> >> > there a solution of the problem, that I don't see?
>>
>> Who does call chown in there? Which package?
>> Please show me the logs around the alleged call to chown that is
>> failing.

Are you running SElinux or something like this?
