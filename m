From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Oct 2014 21:44:19 +0200
Subject: [Buildroot] [PATCHv2 buildroot-test 10/11] autobuild-run: save
 config.log files for failed package
In-Reply-To: <1413747007-24990-11-git-send-email-patrickdepinguin@gmail.com>
References: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
 <1413747007-24990-11-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <CAHXCMM+z62GAsyaAmzpv7VpK88+B0A3nVZz64-ggkQOkCufgoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Oct 19, 2014 at 9:30 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> This patch will save all config.log files of the failed package in the
> result tarball, to help problem analysis. This is typically useful for
> autotools packages, although the added logic does not check that
> explicitly (i.e. any failing package that has a config.log file in the
> output directory will see this file saved).

Could you add the same mechanism for CMakeCache.txt files (which are
kind of equivalent of config.log, but for CMake-based packages)?

>
> The saving of config.log files happens recursively, the directory
> structure is preserved in the result directory.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>


Regards,

-- 
Samuel
