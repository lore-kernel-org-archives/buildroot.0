From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jun 2017 17:11:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/libldns: bump version to 1.7.0
In-Reply-To: <20170603131253.10900-1-bernd.kuhls@t-online.de>
References: <20170603131253.10900-1-bernd.kuhls@t-online.de>
Message-ID: <20170603171152.3f5f47ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Jun 2017 15:12:53 +0200, Bernd Kuhls wrote:
> Commit https://git.nlnetlabs.nl/ldns/commit/host2str.c?id=f7b3a9700e91f8e46477f335c5aaac7c6cdd8acb
> added compatability with openssl 1.1.0 but, at the same time, breaks
> build without openssl:

When I try to apply this patch, I get:

thomas at skate:~/projets/buildroot (master)$ git pwam 770780
Applying patch #770780 using 'git am -s'
Description: [1/1] package/libldns: bump version to 1.7.0
Applying: package/libldns: bump version to 1.7.0
fatal: corrupt patch at line 704
Patch failed at 0001 package/libldns: bump version to 1.7.0
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
'git am' failed with exit status 128

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
