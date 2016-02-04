From: Steve Calfee <stevecalfee@gmail.com>
Date: Thu, 4 Feb 2016 09:24:45 -0800
Subject: [Buildroot] Speeding up the Build
Message-ID: <CAJJ6jxvwFavFNNVMnBuCGr4hmEgOdRzyU6XDx=_9bF9a9FUn5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I know buy faster hardware...

We have the ability to share a common download directory, so multiple
systems builds can have faster downloads.

We have the ability to install a pre-build toolchain - that really helps.

We can have multiple output directories, using the single downloaded
buildroot directory. Saves git downloading and disk storage.

Is there any way to share the host built utilities? It could be done
like using a pre-built toolchain, or some kind of special links for
output/host. The problem is .../host is splatted right in the middle
of the dynamic per build output directory. Do these files get changed
much in normal buildroot use, so they should stay in output?

Thanks for any suggestions,
Steve
