From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Jun 2008 01:11:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package/config
Message-ID: <20080619081136.690373C608@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-19 01:11:35 -0700 (Thu, 19 Jun 2008)
New Revision: 22449

Log:
package/config: cygwin fix

- pass HOST_LOADLIBES down to make mconf for cygwin
- fix link-order WRT HOST_LOADLIBES
