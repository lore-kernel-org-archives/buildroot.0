From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 21:41:12 +0200
Subject: [Buildroot] [PATCH v4 1/3] package/tvheadend: Fix inclusion of
 dtv-scan-tables files
In-Reply-To: <1428603370-15627-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428603370-15627-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150409214112.0b97865b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu,  9 Apr 2015 20:16:08 +0200, Bernd Kuhls wrote:
> --enable-dvbscan forces downloading the tables from upstream when the
> files are not already present in data/dvb-scan/, see support/getmuxlist.
> 
> By moving the copy command for the dvb-scan files before tvheadend configure
> the getmuxlist script, called by tvheadend configure, will recognize the
> existing directory, quote: "# Note: will not update existing set (if not .git)"
> 
> To verify the bundled contents have a look at build.linux/bundle.d.
> Also fix a comment typo.
> 
> Fixes
> http://autobuild.buildroot.net/results/25f/25fc657dbc37228483eeefb3618be9df2ee13832/
> http://autobuild.buildroot.net/results/37a/37abb5d2ec62ac59897d019e6ca85c8eb0e69786/
> http://autobuild.buildroot.net/results/e86/e860e501f904d94bbab6a765aad4d19947135513/
> http://autobuild.buildroot.net/results/a55/a55ab4fc34bebda14236d6a0efe893aa75374ed2/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
