From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 10:03:01 +0200
Subject: [Buildroot] [PATCH] vsftpd: use pkg-config to get OpenSSL link
	flags
In-Reply-To: <1431464824-22153-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 12 May 2015 23:07:04 +0200")
References: <1431464824-22153-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87oalogb0q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Instead of hardcoding -lssl -lcrypto as the linker flags to link with
 > OpenSSL, use pkg-config to fetch those flags. This allows to behave
 > properly when doing static linking, since pkg-config returns the
 > entire set of libraries we should link against.

 > Fixes:

 >   http://autobuild.buildroot.org/results/d71/d710ecfa9ed0a8e3f97d2010d3dabb372485c7f2/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
