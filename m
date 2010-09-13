From: Anders Darander <anders.darander@gmail.com>
Date: Mon, 13 Sep 2010 20:37:55 +0200
Subject: [Buildroot] gdb and external toolchain
In-Reply-To: <4C8E2777.7030202@carallon.com>
References: <4C8E2777.7030202@carallon.com>
Message-ID: <AANLkTimDzh0kHMk2fjBqMzW8r5r3EAk==q+A7QsH6S9L@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 13, 2010 at 15:30, William Wagner <will_wagner@carallon.com> wrote:
> I'm using an external toolchain and want to get gdbserver onto my target.
> I've seen the patch by Thomas that says that gdb host and gdbserver should
> be provided by the external toolchain and I have set crosstools-ng to build
> them both.

Well, the important thing is that they are built using compatible
versions. In my opinion, the
 easiest way to ensure this, is to have them built together.

> The question I have is is there any mechanism to copy the gdbserver
> executable built with crosstools into the target directory. I can't find
> anything that should be doing this. I can just copy the file over manually
> but was thinking I should add support for this to buildroot. Any suggestions
> on how to do this?

Thomas and Grant have already given some hints. I've got an old
attempt myself, at
http://comments.gmane.org/gmane.comp.lib.uclibc.buildroot/17747, which
I've been using ever since in a project. However, there were some
valid remarks, especially by Yann in that thread. Remember though,
that that patch is for an older version of buildroot.

Regards,
Anders
