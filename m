From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Sep 2010 16:01:34 +0200
Subject: [Buildroot] gdb and external toolchain
In-Reply-To: <4C8E2777.7030202@carallon.com>
References: <4C8E2777.7030202@carallon.com>
Message-ID: <20100913160134.69c0c9f6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Sep 2010 14:30:31 +0100
William Wagner <will_wagner@carallon.com> wrote:

> I'm using an external toolchain and want to get gdbserver onto my 
> target. I've seen the patch by Thomas that says that gdb host and 
> gdbserver should be provided by the external toolchain and I have set 
> crosstools-ng to build them both.
> 
> The question I have is is there any mechanism to copy the gdbserver 
> executable built with crosstools into the target directory.

Not today.

> I can't find anything that should be doing this. I can just copy the file over 
> manually but was thinking I should add support for this to buildroot. 
> Any suggestions on how to do this?

Doing this is on my todo list (with a few other improvements related
to debugging), but I haven't yet thought on how to implement this.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
