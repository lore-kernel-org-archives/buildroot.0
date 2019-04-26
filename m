From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:58:10 +0200
Subject: [Buildroot] [PATCH] package/libxslt: add upstream security fix
 for CVE-2019-11068
In-Reply-To: <20190424133718.19751-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 24 Apr 2019 15:37:18 +0200")
References: <20190424133718.19751-1-peter@korsgaard.com>
Message-ID: <87pnp8ylct.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2019-11068: libxslt through 1.1.33 allows bypass of a protection
 >   mechanism because callers of xsltCheckRead and xsltCheckWrite permit
 >   access even upon receiving a -1 error code.  xsltCheckRead can return -1
 >   for a crafted URL that is not actually invalid and is subsequently loaded.

 > Upstream bugtracker issue not yet public:
 > https://gitlab.gnome.org/GNOME/libxslt/issues/12

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
