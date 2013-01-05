From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Jan 2013 13:46:42 +0100
Subject: [Buildroot] [PATCH 03/20] pthread-stubs: rename to
	xlib_libpthread-stubs
In-Reply-To: <ffc9ba7c256488a47ccc36568d71c55a440efc8a.1357125961.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 2 Jan 2013 12:26:38 +0100")
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <ffc9ba7c256488a47ccc36568d71c55a440efc8a.1357125961.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87r4lziyq5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In upstream X.org releases, pthread-stubs is named libpthread-stubs,
 Thomas> so for consistency reasons, we rename the Buildroot package
 Thomas> accordingly. Also, while we're at it, we add a xlib_ prefix to the
 Thomas> package to match other X.org libraries in Buildroot.

 Thomas> The necessary Config.in.legacy code is added to ensure that users
 Thomas> having .config files using the old configuration option name get a
 Thomas> warning.

Committed the remaining parts of the series, thanks.

-- 
Bye, Peter Korsgaard
