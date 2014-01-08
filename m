From: Andre Renaud <andre@bluewatersys.com>
Date: Thu, 9 Jan 2014 09:36:47 +1300
Subject: [Buildroot] Empty utility package scripts
Message-ID: <CAPfzE3bOwMBNDLJszXtEK8OfAsWdgLTvt-8ObvJvnBcnyHQhDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm trying to create a utility package script which doesn't do any
downloading, just copies some local files around (startup scripts),
and creates a user in /etc/passwd. However I can't find any examples
of packages that don't do any downloading/configuring/building.

Is this possible, or am I going about it the wrong way?

Regards,
Andre
