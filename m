From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Dec 2013 10:21:50 +0100
Subject: [Buildroot] [PATCH v3] lftp: new package
In-Reply-To: <1386058807-4904-1-git-send-email-rebillout@syscom.ch> ("Arnaud
 =?utf-8?Q?R=C3=A9billout=22's?= message of "Tue, 3 Dec 2013 09:20:07
 +0100")
References: <1386058807-4904-1-git-send-email-rebillout@syscom.ch>
Message-ID: <8738m7irf5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnaud" == Arnaud R?billout <rebillout@syscom.ch> writes:

 > LFTP is a sophisticated ftp/http client, and a file transfer program
 > supporting a number of network protocols. Like BASH, it has job
 > control and uses the readline library for input. It has bookmarks,
 > a built-in mirror command, and can transfer several files in parallel.
 > It was designed with reliability in mind.

 > Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
 > ---
 > v3:
 >   + patch improved: there is now just one patch that add a test in the
 > cross-compiling branch of AC_TRY_RUN
 >   + Config.in: some sensible default values:
 >     + sleep command enabled, since it takes no space
 >     + mirror command enabled, since it's the killer feature of lftp that
 > makes it interesting compared to other clients, like ncftp
 >     + FTP proto enabled by default, since the name of the package (lftp)
 > suggests it

Committed, thanks.

-- 
Bye, Peter Korsgaard
