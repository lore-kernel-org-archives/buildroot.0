From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 May 2013 17:18:54 +0200
Subject: [Buildroot] [PATCH] legal-info: fail trying to copy a
	non-existent license file
In-Reply-To: <1368535563-10393-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Tue, 14 May 2013 14:46:03 +0200")
References: <1368535563-10393-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87ip2lsi75.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> If a package's _LICENSE_FILES contains the name of a non-existent file,
 Luca> the make process would continue and return true, unless the
 Luca> non-existent file is the last listed.

 Luca> Fix this wrong beaviour by failing with an error when any of the listed
 Luca> files is missing.

Committed, thanks.

-- 
Bye, Peter Korsgaard
