From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Feb 2016 00:07:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/vpnc: fix musl build
In-Reply-To: <1453640456-32346-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453640456-32346-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160211000743.33a1e73f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 24 Jan 2016 14:00:56 +0100, Bernd Kuhls wrote:
> The autobuilders did not catch the error yet because they failed
> earlier with other packages, but I am continuing the build based
> on the defconfig from:
> http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Once again, those patches really didn't had a proper commit log, so I
don't want to merge something like this. Yes the other existing patches
for vpnc are crappy, but it's not a reason to add more of them.

So instead, I've sent a series which updates the vpnc package,
reformats the patch with Git, splits them properly, adds proper commit
logs, and I submitted a pull request upstream.

See:

  http://lists.busybox.net/pipermail/buildroot/2016-February/152495.html

Could you review all the pending musl fix patches from you that are in
patchwork, and try to rework the ones where the musl patches don't
have a proper commit log. Hint: if the commit log is just "musl fix",
then it's wrong. If the commit makes it work for musl, but is otherwise
non-upstreamable, it's wrong.

It would really help if you could clean up some of those patches. We do
want to fix musl related issues, but not at the expense of having
unclean patches added in Buildroot.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
