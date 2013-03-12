From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 12 Mar 2013 11:10:46 -0700
Subject: [Buildroot] IOzone license questions
Message-ID: <CAKcgs2yfYVyZHbBVno+u4uLLkfNeL8iLqXmqgtF4+9xv12akgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

These questions are for the license experts out there.
I would like to add IOzone as a new package to buildroot. Problem is
that IOzone license is quite restrictive.
Here's the main part:

License to freely use and distribute this software is hereby granted
  by the author, subject to the condition that this copyright notice
  remains intact.  The author retains the exclusive right to publish
  derivative works based on this work, including, but not limited to,
  revised versions of this work.


My questions are the following:
- Is it OK to add this package to buildroot, despite its restrictive license?
- The text of the license is not provided with the source code, but is
available on IOzone website.
Should I point to the website link in the package makefile?
e.g. IOZONE_LICENSE_FILES = http://www.iozone.org/docs/Iozone_License.txt
Or should I leave it to the user to go and find it on his own?

Thanks.
Gilles.
