From: Dan Lyke <danlyke@flutterby.com>
Date: Fri, 30 Jan 2009 16:44:18 -0800
Subject: [Buildroot] Won't build kernel
In-Reply-To: <ED397211-8106-4E05-9702-625310A5CF37@laptouchinc.com>
References: <ED397211-8106-4E05-9702-625310A5CF37@laptouchinc.com>
Message-ID: <20090130164418.7ea4aca7@danhplaptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 30 Jan 2009 18:43:11 -0500
Daniel Jabbour <daniel@laptouchinc.com> wrote:
> I'm pretty new to buildroot. However, I have been successfully able
> to compile a toolchain and root fs. Now I am trying to also compile
> a kernel using buildroot.

If you haven't used one of the "_defconfig" files (ie: I'm working on
at at91sam9261-ek board for prototyping, so I do a "make
at91sam9261_defconfig" to set up default configuration), then you may
need to do a "make linux26-menuconfig" as a separate step to set up a
Linux kernel configuration. This will probably also need a whole bunch
of setup for your board.

Am I making any sense here?

Dan
