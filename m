From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Apr 2013 20:36:00 +0200
Subject: [Buildroot] [PATCH v2] eliminate double slashes caused by
	FOO_SITE ending in a slash
In-Reply-To: <1365795630-3915-1-git-send-email-shawn7400@gmail.com> (Shawn
 J. Goff's message of "Fri, 12 Apr 2013 15:40:30 -0400")
References: <1365785580-1868-1-git-send-email-shawn7400@gmail.com>
 <1365795630-3915-1-git-send-email-shawn7400@gmail.com>
Message-ID: <87d2tvmyjz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Shawn" == Shawn J Goff <shawn7400@gmail.com> writes:

 Shawn> From: "Shawn J. Goff" <shawn7400@gmail.com>
 Shawn> When a FOO_SITE variable ends in a slash and gets joined with a
 Shawn> FOO_SOURCE variable like $(FOO_SITE)/$(FOO_SOURCE), the resulting URI
 Shawn> has a double slash. While double-slashes are fine in unix paths, they
 Shawn> are reserved in URIs - the part following '//' must be an authority.

You forgot to sign off on v2, but as you already signed off on the first
one I've added it myself.

Also please don't forget to mention what you have changed when you send
a revised patch (under the --- line).

Committed, thanks.

-- 
Bye, Peter Korsgaard
