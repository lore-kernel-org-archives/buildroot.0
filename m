From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:46:25 +0100
Subject: [Buildroot] [PATCH 0/1] (node.js) fix npm CC, other npm tweaks
In-Reply-To: <1416775178-13738-1-git-send-email-mwei@cs.ucsd.edu>
References: <1416775178-13738-1-git-send-email-mwei@cs.ucsd.edu>
Message-ID: <20141123214625.619c57da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Michael Wei,

On Sun, 23 Nov 2014 12:39:37 -0800, Michael Wei wrote:
> For some reason, node modules with native code (compiled using tools
> like gyp) were not being cross compiled properly without the
> --target_arch switch.
> 
> In addition, the version of npm that is provided with the version of
> node uses is old, and has some bugs like race conditions in dependency
> resolution which can break builds, so this patch also updates the 
> host npm before install.
> 
> Finally, node modules are now installed globally. This allows modules
> to install things such as command line utilities.

Thanks for this contribution. Could you include this detailed
explanation into the commit log of the patch?

Currently, the detailed explanation is only part of the cover letter,
which will not become part of the Buildroot commit history. It would
therefore be better to have the same explanation inside the patch
itself, so that it will become part of the Buildroot commit history.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
