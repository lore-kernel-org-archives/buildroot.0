From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 14:37:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix build with
 fallback hostname
In-Reply-To: <20180129094506.31553-1-chemobejk@gmail.com> (Stefan Becker's
 message of "Mon, 29 Jan 2018 11:45:06 +0200")
References: <20180129094506.31553-1-chemobejk@gmail.com>
Message-ID: <87zi4w7pm6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Becker <chemobejk@gmail.com> writes:

 > Commit aebabb2780da4c5f85fec00b56f4690feb646073 used an autmoake
 > configuration option. Replace it with the meson version.

 > Fixes #10716

 > Signed-off-by: Stefan Becker <chemobejk@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
