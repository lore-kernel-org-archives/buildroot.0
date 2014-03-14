From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Fri, 14 Mar 2014 23:21:31 +0100
Subject: [Buildroot] [PATCH 0/2] Add mail packages
Message-ID: <BLU0-SMTP145DC3EA39B458464EFE2D3D9700@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this is the first set of patches to add these mail packages to buildroot:

- fetchmail
- exim
- dovecot
- dovecot-pigeonhole

For better access to these and other mail packages already present in buildroot
I suggest to create a new top level section in menuconfig especially for them.
Since I also want to send a leafnode2 package at a later stage this section
might later get renamed to "mail/news".

I am sending this unfinished set today to start a discussion whether the
new menuconfig section is acceptable or not.

Regards, Bernd


Bernd Kuhls (2):
  Create new section "Mail" in menuconfig and collect mail packages
  fetchmail: New package

 package/Config.in              |   14 +++++++++-----
 package/fetchmail/Config.in    |   12 ++++++++++++
 package/fetchmail/fetchmail.mk |   23 +++++++++++++++++++++++
 3 files changed, 44 insertions(+), 5 deletions(-)
 create mode 100644 package/fetchmail/Config.in
 create mode 100644 package/fetchmail/fetchmail.mk

-- 
1.7.10.4
