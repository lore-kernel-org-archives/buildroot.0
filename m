From: Wade Berrier <wberrier@gmail.com>
Date: Mon, 4 Aug 2008 14:53:43 -0600
Subject: [Buildroot] [PATCH] fix bash job control (was: my
	/etc/init.d/rcS won't run)
In-Reply-To: <IMyjSUFq.1217872591.9273960.beattie@localhost>
References: <bbbeeccd0808040936ge7d230au913b6949fcf7a025@mail.gmail.com>
	<IMyjSUFq.1217872591.9273960.beattie@localhost>
Message-ID: <bbbeeccd0808041353h1c99f439yb42fdb63429c9f0b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Aug 4, 2008 at 11:56 AM, Brian Beattie <beattie@beattie-home.net> wrote:
> On 8/4/2008, "Wade Berrier" <wberrier@gmail.com> wrote:
>
>>And now the actual patch :-P
>>
>>On Mon, Aug 4, 2008 at 10:35 AM, Wade Berrier <wberrier@gmail.com> wrote:
>>> Hi,
>>>
>>> Marc from the previous thread pointed me in the right direction to fix this.
>>>
>>> Attached is a patch to bash.mk so it builds correctly and can be used
>>> from busybox's init.
>>>
>
> I tried the patch, but got the attched errors (edited for brevity)
>

I remember seeing those errors last week when I tried this, but I'm
not seeing them now.

I must have changed something else in my config :(  But I know it
works now because I've done a full rebuild.

Attaching my bash config.log to see if that helps.

Wade
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.log.bz2
Type: application/x-bzip2
Size: 22441 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080804/fa635636/attachment-0001.bin 
