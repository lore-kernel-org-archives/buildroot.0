From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 13:53:42 +0200
Subject: [Buildroot] [PATCH 1/2] package/libseccomp: bump version to
 2.2.0
In-Reply-To: <1427638949-3191-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427638949-3191-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150331135342.7ff914ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 29 Mar 2015 16:22:28 +0200, Bernd Kuhls wrote:
> - change upstream URL, project moved to github
> - removed patches not needed anymore since project switched to autoconf
> - add newly supported platforms to Config.in
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This update fails to build with a number of toolchains:

http://autobuild.buildroot.org/results/092/092143df2b91d50850067274da531c713f2ccb72/build-end.log
http://autobuild.buildroot.org/results/bd1/bd105e821de583e582199aae31fab13ef17e67a0/build-end.log

Can you have a look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
