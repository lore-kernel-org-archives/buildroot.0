From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Jul 2020 00:14:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: drop unused systemd
 file
In-Reply-To: <20200606195028.3222-1-danomimanchego123@gmail.com> (Danomi
 Manchego's message of "Sat, 6 Jun 2020 15:50:28 -0400")
References: <20200606195028.3222-1-danomimanchego123@gmail.com>
Message-ID: <87v9j14nk3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > Commit 54ea03ccd7d68bcf846a7cb8fa58b9fb3ac0b914 ("package/syslog-ng:
 > implement systemd enablement using DefaultInstance") replaced the lines
 > installing the syslog-ng at default file with printf lines creating a file
 > in a syslog-ng at .service.d/ directory on-the-fly.  Since then, nothing
 > uses the syslog-ng at default file, so let's delete it.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
