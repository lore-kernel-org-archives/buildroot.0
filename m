From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Oct 2017 20:46:48 +0200
Subject: [Buildroot] [PATCH 1/1] webkitgtk: security bump to version
	2.18.2
In-Reply-To: <20171027161033.8582-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Fri, 27 Oct 2017 19:10:33 +0300")
References: <20171027161033.8582-1-aperez@igalia.com>
Message-ID: <871sloo2cn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > This is a maintenance release of the current stable WebKitGTK+ version,
 > which contains bugfixes; mostly for crashes and rendering issues, plus
 > one important fix for the layout or Arabic text.

 > Release notes:

 >     https://webkitgtk.org/2017/10/27/webkitgtk2.18.2-released.html

 > Even though an acconpanying security advisory has not been published
 > for this release, the release contains fixes for several crashes (one
 > of them for the decoder of the very common GIF image format), which
 > arguably can be considered potential security issues.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
