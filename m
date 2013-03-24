From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 22:09:16 +0100
Subject: [Buildroot] [PATCH] <pkg>-rsync: Reincluding core files and
	folders, which got kicked out by --cvs-exclude option.
In-Reply-To: <514C7F46.8070806@andin.de> (Andreas Naumann's message of "Fri,
 22 Mar 2013 16:56:54 +0100")
References: <514C7F46.8070806@andin.de>
Message-ID: <87wqswh5dv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andreas" == Andreas Naumann <dev@andin.de> writes:

 Andreas> The --cvs-exclude option also excludes 'core', which when rsyncing
 Andreas> e.g. a linux tree is less than optimal..

Could you please use 'git send-email' in the future? Your Thunderbird
has corrupted the patch pretty badly (tabs->spaces, word wrapping, ..)

I've fixed it up manually this time.

-- 
Bye, Peter Korsgaard
