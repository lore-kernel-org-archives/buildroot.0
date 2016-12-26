From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Dec 2016 09:21:27 +0100
Subject: [Buildroot] Autobuild reproduction and generation
In-Reply-To: <CADZ=QZ=SU7XthdVfaAQpeY7LKJcsOME1zOusWvZAEjs0OpRfZw@mail.gmail.com>
References: <CADZ=QZ=SU7XthdVfaAQpeY7LKJcsOME1zOusWvZAEjs0OpRfZw@mail.gmail.com>
Message-ID: <20161226092127.1c4a40d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Dec 2016 16:15:19 +0800, Yu-Ting Kao wrote:

> I want to contribute some patches for buildroot, and I found autobuild
> <http://autobuild.buildroot.org/>system
> ?that can find bugs at commit early stage.?
> 
> 1. How can I run this random build script and send it to autobuild system ?

The script that runs on the autobuilder build machines is available in
the Git repository at https://git.buildroot.org/buildroot-test/, in
scripts/autobuild-run.

In order to submit your build results to autobuild.b.o, you need an
account, which I can create. But before that, you should run the script
standalone for a day or two, look at the generated build results to see
if there isn't anything obviously wrong (i.e not a real build failure,
but a build failure due to your installation).

> 2. How can I reproduce the issue which are posted at autobuild system ?
>     All I know is that, copy the config file and build code manually. The
> br-reproduce-build script seems not work normally.

I use the br-reproduce-build script and it works fine for me. Could you
be more specific about the issues you've encountered?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
