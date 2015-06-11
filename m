From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Jun 2015 10:05:11 +0200
Subject: [Buildroot] [PATCH 1/1] bc: Bump to version 1.06.95
In-Reply-To: <1433999053-4479-1-git-send-email-grepper@gmail.com>
 (grepper@gmail.com's message of "Thu, 11 Jun 2015 01:04:13 -0400")
References: <1433999053-4479-1-git-send-email-grepper@gmail.com>
Message-ID: <87r3piisaw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "grepper" == grepper  <grepper@gmail.com> writes:

A more detailed description would be good, like the fact that the 1.06
release is ~15 years old and other distibutions are also using the (very
old) alpha release.

 > Signed-off-by: grepper <grepper@gmail.com>

Can you please use your real name, Robert? (Both in From and in your S-O-B).

> ---
 >  package/bc/01_typo_in_bc.patch               |  19 +
 >  package/bc/02_hyphens_as_minus_in_man.patch  |  89 ++++
 >  package/bc/03_array_initialize.patch         |  20 +
 >  package/bc/04_info_dircategory.patch         |  30 ++
 >  package/bc/05_notice_read_write_errors.patch | 708 +++++++++++++++++++++++++++
 >  package/bc/06_read_dcrc.patch                |  92 ++++
 >  package/bc/07_bc_man.patch                   | 417 ++++++++++++++++

Please document where these patches come from. Are they all needed? From
a quick check only patch 03 and maybe 05 seems critical, the rest are
just documentation stuff.

Care to fixup these issues and resend? Thanks!

-- 
Bye, Peter Korsgaard
