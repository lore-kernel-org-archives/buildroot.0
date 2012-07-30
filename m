From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 16:37:42 +0200
Subject: [Buildroot] [PATCH v3] curlftpfs: new package
In-Reply-To: <1343657348-28746-1-git-send-email-rbraun@sceen.net>
References: <1343130272-5715-1-git-send-email-rbraun@sceen.net>
 <1343657348-28746-1-git-send-email-rbraun@sceen.net>
Message-ID: <20120730163742.6ff19fc8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 30 Jul 2012 16:09:08 +0200,
Richard Braun <rbraun@sceen.net> a ?crit :

>  package/Config.in                                  |    1 +
>  package/curlftpfs/Config.in                        |   17 ++++++
>  .../curlftpfs-000-fix-CURLOPT_INFILESIZE.patch     |   11 ++++
>  ...curlftpfs-001-free_ftpfs_file-memleak-fix.patch |   13 +++++
>  .../curlftpfs-002-nocache-memleak-fix.patch        |   58 ++++++++++++++++++++

Could you please include a description in each patch + Signed-off-by
line, or if you're not the author, a reference to the original place,
and possibly their upstreamable status?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
