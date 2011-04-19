From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 19 Apr 2011 09:44:52 +0200
Subject: [Buildroot] creating skeleton during build
In-Reply-To: <264265.10486.qm@web132205.mail.ird.yahoo.com>
References: <264265.10486.qm@web132205.mail.ird.yahoo.com>
Message-ID: <BANLkTikxio2KVpiw0wck6YuEQUvr4pGKsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/4/19 John Smith <jf15190@yahoo.com>
> All goes well until I do a second build, the system tries to re-make the root skeleton even though it already exists and is older than $(TARGET_DIR) so I have to comment out the above line for the second build. Any way to avoid this?

To just prevent the skeleton to be copied, try "touch output/build/.root".
