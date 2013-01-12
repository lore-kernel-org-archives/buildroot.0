From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:45:54 +0100
Subject: [Buildroot] [PATCH 18/28] libgtk2: add support for some
	optional X dependencies
In-Reply-To: <f81b3c2a5b24ca73365e9b40c83c83cd04f544ca.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:30 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <f81b3c2a5b24ca73365e9b40c83c83cd04f544ca.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87d2xa2hyl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> libgtk2 can optionally use a number of features from additional X
 Thomas> extensions, so we add support for those, to ensure that Gtk gets built
 Thomas> after those extensions if they have been enabled in the Buildroot
 Thomas> configuration.

 Thomas> The extensions are Xinerama, Xinput, Xrandr, Xcursor, Xfixes,
 Thomas> Xcomposite and Xdamage.

Committed, thanks.

-- 
Bye, Peter Korsgaard
