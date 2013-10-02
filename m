From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Oct 2013 22:21:48 +0200
Subject: [Buildroot] [Patch v5] libcgroup: new package
In-Reply-To: <1380717964-15081-1-git-send-email-clshotwe@rockwellcollins.com>
 (Clayton Shotwell's message of "Wed, 2 Oct 2013 07:46:04 -0500")
References: <1380717964-15081-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <87siwjpgo3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Clayton" == Clayton Shotwell <clshotwe@rockwellcollins.com> writes:

 Clayton> Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
 Clayton> ---
 Clayton> Changes v4 -> v5:
 Clayton>   - Cleaned up extra spaces (suggested by Peter)
 Clayton>   - Corrected the dl path (suggested by Peter)
 Clayton>   - Added dependencies on BR2_TOOLCHAIN_USES_GLIBC and
 Clayton>     BR2_INSTALL_LIBSTDCPP rather than reworking the 
 Clayton>     package (suggested by Peter)
 Clayton> Changes v3 -> v4:
 Clayton>   - Changed the length of the config comment (suggested by Thomas)
 Clayton>   - Removed unneeded configure options (suggested by Thomas)
 Clayton> Changes v2 -> v3:
 Clayton>   - No changes.
 Clayton> Changes v1 -> v2:
 Clayton>   - General cleanup to the mk file to conform to the standard format.
 Clayton>   - Corrected the license version and license file to be correct.
 Clayton>   - Cleaned up the configure options to enable options for static
 Clayton>     libraries and linux-pam if they are selected in the configuration.

Committed, thanks.

-- 
Bye, Peter Korsgaard
