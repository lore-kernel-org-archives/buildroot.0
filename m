From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Nov 2014 23:11:59 +0100
Subject: [Buildroot] [PATCH v2] luajit: point /usr/bin/lua to luajit if
	lua not selected
In-Reply-To: <1417373172-3806-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Sun, 30 Nov 2014 13:46:12 -0500")
References: <1417373172-3806-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <873890jq34.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > The luajit package is a provider of a lua interpreter, but does not install a
 > lua executable.  This is fine for scripts that explicitly invoke luajit, but
 > not so good for scripts that just need a lua interpreter and call lua.  This
 > mod creates a lua symlink so that the non-jit-specific scripts will still work.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
