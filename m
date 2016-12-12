From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Dec 2016 10:57:52 +0100
Subject: [Buildroot] [PATCH] e2fsprogs: fix missing OPTS
In-Reply-To: <20161212091938.24412-1-maxime.hadjinlian@gmail.com> (Maxime
 Hadjinlian's message of "Mon, 12 Dec 2016 10:19:38 +0100")
References: <20161212091938.24412-1-maxime.hadjinlian@gmail.com>
Message-ID: <87pokxqxjz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > With the commit	64544178f180f03cedd8fe403d3718406d909c88 many packages
 > broke because they could not find the ext2fs.pc file.

 > This is perfectly normal, as the DESTDIR and the install target were not
 > passed anymore to make.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Committed after removing the extra E2FSPROGS_INSTALL_STAGING_OPTS at the
top of the file, thanks.

-- 
Bye, Peter Korsgaard
