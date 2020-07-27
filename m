From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 09:21:47 +0200
Subject: [Buildroot] [PATCH 1/2] package/tpm2-abrmd: bump version to
 2.3.2
In-Reply-To: <20200525214853.14277-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 25 May 2020 23:48:52 +0200")
References: <20200525214853.14277-1-peter@korsgaard.com>
Message-ID: <87eeoxwhh0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes various initialization / systemd issues. From the changelog:
 > - Provide meaningful exit codes on initialization failures.
 > - Prevent systemd from starting the daemon before udev changes ownership of
 >   the TPM device node.
 > - Prevent systemd from starting the daemon if there is no TPM device node.
 > - Prevent systemd from restarting the daemon if it fails.
 > - Add SELinux policy to allow daemon to resolve names.
 > - Add SELinux policy boolean (disabled by default) to allow daemon to
 >   connect to all unreserved ports.

 > Also adjust .hash file white space to match new agreements.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
