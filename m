From: glscantlen <glscantlen@gmail.com>
Date: Sat, 11 Jul 2015 06:41:11 -0700 (PDT)
Subject: [Buildroot] [Bug 8206] mplayer uses host xorg development files
In-Reply-To: <20150707210059.917A78015E@busybox.osuosl.org>
References: <bug-8206-163@https.bugs.busybox.net/>
 <20150707210059.917A78015E@busybox.osuosl.org>
Message-ID: <1436622071664-105281.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

to:	bugzilla at busybox.net
date:	Thu, Jul 9, 2015 at 9:46 PM
subject:	Re: [Bug 8206] mplayer uses host xorg development files
mailed-by:	gmail.com


Bernd,

I applied your patch and "make mplayer-reinstall" without the host's
xorg-dev installed.
still same issue.

I was not sure of the proper way to apply the patch within the buildroot
env.
So I applied it manually. What is the proper way to patch a <package>.mk?
I did not think it would go into the
package/0007-Add-additional-X11-dependencies.patch.




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Bug-8206-New-mplayer-uses-host-xorg-development-files-tp104861p105281.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
