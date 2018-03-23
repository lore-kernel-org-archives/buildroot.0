From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Mar 2018 16:29:29 +0100
Subject: [Buildroot] [PATCHv2 2/2] efivar: bump version
In-Reply-To: <20180323095741.16512-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 23 Mar 2018 10:57:41 +0100")
References: <20180323095741.16512-1-peter@korsgaard.com>
 <20180323095741.16512-2-peter@korsgaard.com>
Message-ID: <87bmfe3j52.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Drop 0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch and
 > 0003-Remove-some-extra-const-that-gcc-complains-about.patch as they are now
 > upstream.

 > The upstream repo moved to the 'rhboot' github project, so adjust upstream
 > URL in .mk and help text to match.

 > Drop dependency on !musl as it is now support since e04281e60cf0d
 > (makeguids: Ensure compatibility with other libcs).

 > Drop BINTARGETS workaround as this is fixed since 6c674283697 (Don't build
 > static by default).

 > Drop popt dependency as it is no longer needed since 1aec5e7891 (Replace
 > popt usage with getopt_long in efivar.c).

 > While we are at it, also add a hash for the license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > Changes since v1:
 > - Drop popt dependency

Committed, thanks.

-- 
Bye, Peter Korsgaard
