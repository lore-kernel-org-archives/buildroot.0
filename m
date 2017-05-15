From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 13:52:09 +0200
Subject: [Buildroot] Hop tout set svn credentials when using svn to
	download tarballs
In-Reply-To: <D02BDAEC-5CBA-4A06-9645-C6663DB2F3DC@osmos-group.com> (Samir
 Mouhoune's message of "Thu, 11 May 2017 05:35:17 +0000")
References: <D02BDAEC-5CBA-4A06-9645-C6663DB2F3DC@osmos-group.com>
Message-ID: <87a86ejq1i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samir" == Samir Mouhoune <mouhoune@osmos-group.com> writes:

 > Hi,
 > I would like to know if is there a way to set svn credentials (username and
 > password) when using secure svn server to download some pkgs tarballs.

The details depends on your subversion configuration (E.G. plain svn://
or svn-over-ssh), but one option is to tweak the exact command used to
access svn repos under Build options->Commands->Subversion command and
add the desired svn arguments (E.G. --username foo --password bar).

-- 
Bye, Peter Korsgaard
