From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 22:38:33 +0100
Subject: [Buildroot] [PATCH] micropython-lib: Indicate that pcre is a
	runtime dependency
In-Reply-To: <20170125072447.23526-1-judge.packham@gmail.com> (Chris Packham's
 message of "Wed, 25 Jan 2017 20:24:47 +1300")
References: <20170125072447.23526-1-judge.packham@gmail.com>
Message-ID: <8737g6g6qu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:

 > libpcre is needed at runtime not a buildtime. Indicate this in Config.in
 > and remove MICROPYTHON_LIB_DEPENDENCIES.

 > Signed-off-by: Chris Packham <judge.packham@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
