From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 05 Jul 2017 17:16:52 +0200
Subject: [Buildroot] [PATCH 1/1] webkitgtk: bump to version 2.16.5
In-Reply-To: <20170705143303.26282-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Wed, 5 Jul 2017 17:33:03 +0300")
References: <20170705143303.26282-1-aperez@igalia.com>
Message-ID: <87a84izzff.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > This simply updates to the latest stable release. WebKitGTK+ versions
 > in the 2.1x series avoid bumping the dependencies in order to allow
 > distributions to provide updates, therefore no new dependencies are
 > needed.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Thanks! I've had bumping webkitgtk on my TODO for a while as there old
version is affected by a number of CVEs.

I take it that you actively use webkitgtk? I personally don't. Would you
be interested getting added to DEVELOPERS and looking after the package?

Committed, thanks.

-- 
Bye, Peter Korsgaard
