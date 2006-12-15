From: Pavel Roskin <proski@gnu.org>
Date: Fri, 15 Dec 2006 02:40:58 -0500
Subject: [Buildroot] [patch] mpg123 build issues
In-Reply-To: <20061214160303.GA2577@aon.at>
References: <200612141602.15413.uli@suse.de> <20061214152905.GA1993@aon.at>
	<200612141653.07781.uli@suse.de>  <20061214160303.GA2577@aon.at>
Message-ID: <1166168458.2220.24.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2006-12-14 at 17:03 +0100, Bernhard Fischer wrote:
> >> May i ask you to verify that a) an mpg123 bug exists in the
> >> bug-database and if so b) incooperate possible additional fixes?
> >
> >I couldn't find any.

Actually, I sent a patch that upgrades mpg123 to the latest version that
uses an Autoconf generated configure script.  It's much better than to
tweak makefiles not to ignore our variables.  Unfortunately, I was asked
additional questions that I didn't have time to answer.

The current version is 0.61.  My old patch doesn't apply anymore.
Here's the thread in case anyone wants to continue my effort:
http://buildroot.uclibc.org/lists/buildroot/2006-November/thread.html#626

-- 
Regards,
Pavel Roskin
