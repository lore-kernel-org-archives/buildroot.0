From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 15:23:34 +0200
Subject: [Buildroot] [PATCHv3 10/14] gcc: create symbolic link to
	ld-linux in EABIhf/gcc 4.7/eglibc
In-Reply-To: <1373961805-3901-11-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 16 Jul 2013 10:03:21 +0200")
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqoqzlih.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When using eglibc, the ld-linux loader is installed as
 Thomas> ld-linux-armhf.so.3, but gcc 4.7.x was not yet updated, and generates
 Thomas> binaries that reference ld-linux.so.3. This was fixed starting with
 Thomas> gcc 4.8.x. In order to be able to use gcc 4.7, we create the
 Thomas> appropriate symbolic link.

Committed, thanks.

-- 
Bye, Peter Korsgaard
