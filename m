From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 6 Dec 2010 01:56:52 -0500
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
In-Reply-To: <20101205131952.50400c59@surf>
References: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
	<20101205115745.0e86c054@surf> <20101205131952.50400c59@surf>
Message-ID: <201012060156.53523.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday, December 05, 2010 07:19:52 Thomas Petazzoni wrote:
> Yet another question regarding non-MMU support and support for static
> builds in Buildroot. Obviously, not all packages support non-MMU
> architectures and/or static build, so it'd be good to not allow the
> users to select those packages. So the packages known to work for
> non-MMU and/or static build should be clearly identified.

you can do shared libs under nommu systems.  binding the two makes no sense.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101206/11eb6c56/attachment-0001.pgp>
