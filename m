From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Mar 2018 23:46:44 +0100
Subject: [Buildroot] [PATCH] efibootmgr: bump version
In-Reply-To: <20180322125153.28766-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 22 Mar 2018 13:51:53 +0100")
References: <20180322125153.28766-1-peter@korsgaard.com>
Message-ID: <87y3ij4tkb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Drop 0001-dont-use-fshort-wchar-when-building.patch and
 > 0003-Remove-extra-const-keywords-gcc-7-gripes-about.patch as they are now
 > upstream.

 > The upstream repo moved to the 'rhboot' github project, so adjust upstream
 > URL in .mk and help text to match.

 > Version 15 introduces build time configuration of the default EFI directory
 > (E.G. the subdirectory in the EFI system partition where the loader is
 > installed).  This used to be hardcoded to redhat, but now a value must be
 > specified at build time.  Given that, it is unlikely that people relied on
 > the default value so set it to the more sensible 'buildroot'.

 > While we are at it, also add a hash for the license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
