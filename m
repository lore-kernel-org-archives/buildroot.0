From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2020 17:06:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/xen: disable go tools
In-Reply-To: <20201107174337.1076602-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 7 Nov 2020 18:43:37 +0100")
References: <20201107174337.1076602-1-fontaine.fabrice@gmail.com>
Message-ID: <874klytsz4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > go tools are enabled by default since version 4.14.0 and
 > https://github.com/xen-project/xen/commit/1e13ea98bbb8369d065af4666c45c26dab5240d5

 > Disable them to avoid the following build failure on arm or aarch64
 > (when host-go is built before xen):

 > aarch64-none-linux-gnu-gcc: error: unrecognized command line option '-m64'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/08948e4c4a88fbf09cae524949e5b656882a6e9a
 >  - http://autobuild.buildroot.org/results/d966585c931ca4a4ae6a854a21e07eec4c277a02

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
