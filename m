From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 14:00:05 +0100
Subject: [Buildroot] [git commit] package/vsftpd: S70vsftpd: correct -x
 argument to start-stop-daemon
In-Reply-To: <20201127170211.40C93865F5@busybox.osuosl.org> (Peter Korsgaard's
 message of "Fri, 27 Nov 2020 18:13:52 +0100")
References: <20201127170211.40C93865F5@busybox.osuosl.org>
Message-ID: <87h7osqyzu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=405f76425d20ef2f84006f2f6db798c338691c13
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes #13341

 > The -x / --exec start-stop-daemon option expects the path to the executable,
 > not just the name, leading to errors when running the init script:

 > Starting vsftpd: start-stop-daemon: unable to stat //vsftpd (No such file or directory)

 > Reported-by: tochansky at tochlab.net
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
