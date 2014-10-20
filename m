From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Oct 2014 11:45:30 +0200
Subject: [Buildroot] [PATCHv2 buildroot-test 10/11] autobuild-run: save
 config.log files for failed package
In-Reply-To: <CAHXCMM+z62GAsyaAmzpv7VpK88+B0A3nVZz64-ggkQOkCufgoA@mail.gmail.com>
References: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
 <1413747007-24990-11-git-send-email-patrickdepinguin@gmail.com>
 <CAHXCMM+z62GAsyaAmzpv7VpK88+B0A3nVZz64-ggkQOkCufgoA@mail.gmail.com>
Message-ID: <CAAXf6LWwLKGftd622rz03Koi=XfUpAheMtaF8F1UBrs77RAjBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 19, 2014 at 9:44 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Thomas,
>
> On Sun, Oct 19, 2014 at 9:30 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> This patch will save all config.log files of the failed package in the
>> result tarball, to help problem analysis. This is typically useful for
>> autotools packages, although the added logic does not check that
>> explicitly (i.e. any failing package that has a config.log file in the
>> output directory will see this file saved).
>
> Could you add the same mechanism for CMakeCache.txt files (which are
> kind of equivalent of config.log, but for CMake-based packages)?


Yes this could be done, but I'd like to do it as a follow-up patch.

Best regards,
Thomas
