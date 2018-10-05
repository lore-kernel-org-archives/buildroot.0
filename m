From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 19:34:30 +0200
Subject: [Buildroot] [PATCH 2/5] webkitgtk: add dependency on the woff2
 package
In-Reply-To: <20180922235333.85642-3-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Sun, 23 Sep 2018 02:53:30 +0300")
References: <20180922235333.85642-1-aperez@igalia.com>
 <20180922235333.85642-3-aperez@igalia.com>
Message-ID: <877eiw47rt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > The woff2 dependency is used to support Web fonts in WOFF2 format.
 > This is a Web-facing feature that Web sites expect WebKit to support,
 > and it is recommended to be unconditionally enabled. While it is
 > possible to disable the feature at build time, upstream only recommends
 > doing so if the target system cannot provide a woff2 package.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
