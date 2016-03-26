From: Christian Stewart <christian@paral.in>
Date: Sat, 26 Mar 2016 20:33:40 +0000
Subject: [Buildroot] [PATCH 3/3] aufs: new kernel extension
In-Reply-To: <20160326212549.297f7603@free-electrons.com>
References: <1458801186-24700-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
 <20160326212549.297f7603@free-electrons.com>
Message-ID: <1459024420681-0ab9c3bf-3246d574-c1073aff@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Atul, All,
I'm CCing Geoff as this patch series was originally designed for this stack:
Docker Runtime / \ Golang Aufs-util | Aufs-kernel
These are all dependencies for Docker, which is the primary application right
now for layering filesystems.
As such I will soon (tm) pursue getting my Docker patch series to also build on
top of these new contributions towards the Aufs and Golang package series. This
is what I will use primarily to see if they are working as expected in a target
use case.
Thanks for working to improve my patch series Atul, I have read over and
completely agree with Thomas's suggestions and look forward to your next
revisions.
On Sat, Mar 26, 2016 at 4:25 PM Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote: > One thing that is really annoying here is that you can only use Git
> branches. And branches can evolve. So when you say ?aufs4.4? today, you
> have no idea if tomorrow you will download the same source code, since
> the Git branch might have evolved.

Once a release is made it's quite unlikely that they will add any patches unless
they are security critical or major bugfixes. You could if you want pin some
known versions to commit hashes but I think it'd be better to stick with
branches for now.
Thanks! Christian Stewart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160326/66c84136/attachment.html>
