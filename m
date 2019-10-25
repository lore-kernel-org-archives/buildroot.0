From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 19:04:00 +0200
Subject: [Buildroot] [PATCH] package/python-spidev: bump to version 3.4
In-Reply-To: <1571647694-16846-1-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Mon, 21 Oct 2019 10:48:14 +0200")
References: <1571647694-16846-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87lft8iwov.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > This patch bump python-spidev to version 3.4 and updates it's license
 > files.

It would have been good to add a description / link to where it was
changed and explain why the LICENSE.md file isn't used.

Committed with a more detailed commit message, thanks.

I noticed that setup.py still mentions GPLv2 and the LICENSE file isn't
included in the tarball on pypi, so I added a bugtracker issue about
that:

https://github.com/doceme/py-spidev/issues/89

-- 
Bye, Peter Korsgaard
