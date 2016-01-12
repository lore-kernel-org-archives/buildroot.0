From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 23:35:20 +0100
Subject: [Buildroot] [PATCH] dropbear: add help text about key creation
In-Reply-To: <1452302153-9304-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 9 Jan 2016 02:15:53 +0100")
References: <1452302153-9304-1-git-send-email-arnout@mind.be>
Message-ID: <8737u277fb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Commit e7d04dd2d replaced /etc/dropbear with a symlink to /var/run and
 > updated the start scripts to replace it with a real directory, so the
 > keys would be persistent. However, it turns out that this is pretty
 > confusing even for expert users, who don't know how to make the keys
 > really persistent now.

 > Update the help text explaining what the issue is, and telling the user
 > to replace the /etc/dropbear symlink with a symlink to a persistent
 > directory. Also mention the possiblity of unionfs.

 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
