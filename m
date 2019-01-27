From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 22:16:49 +0100
Subject: [Buildroot] [PATCH 2/8] package/sdl_sound: actually use the
 optional CONF_OPTS
In-Reply-To: <20190127185943.1136-3-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 27 Jan 2019 16:59:37 -0200")
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
 <20190127185943.1136-3-ricardo.martincoski@gmail.com>
Message-ID: <87va29n6m6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Since "57ace26b6c package/sdl_sound: add optional support for
 > libmodplug" from 2016, optional CONF_OPTS are added but they do not
 > really take effect because there is an unconditional override below the
 > conditional append.

 > Currently this does not cause build failures, but it can lead to wrong
 > detection of dependencies because many explicit --enable/--disable are
 > not passed to configure.

 > Fix this by moving the unconditional code to the top.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
