From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  5 Jun 2009 16:35:05 +0000 (UTC)
Subject: [Buildroot] [Bug 373] Support for building gstreamer without libxml
In-Reply-To: <bug-373-163@https.bugs.busybox.net/>
References: <bug-373-163@https.bugs.busybox.net/>
Message-ID: <20090605163505.DDF637783A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=373





--- Comment #6 from Markus Heidelberg <markus.heidelberg@web.de>  2009-06-05 16:35:05 UTC ---
(In reply to comment #5)
> Hopefully this takes all the comments above into account.

The config option name and the dependency variable cleanup, yes. But what about
the annodex plugin?
Oh, and personally I like "ifeq" more than "ifneq", especially if the true
condition is the default.
And while I'm nitpicking: the "enable" is superfluous, it's all about enabling
and disabling in this configuration system. And I'd rather keep the description
short (XML dependency) and move further information (registry ...) into a help
section. But now I'll be quiet :)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
