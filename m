From: Andreas Ehmanns <universeii@gmx.de>
Date: Fri, 4 Dec 2015 15:01:51 +0100
Subject: [Buildroot] Howto use "Makeusers"
Message-ID: <56619CCF.6040008@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
to make an openldap server available for buildroot I created an init 
script which starts the ldap server as non-privileged user (and group).
Since the ldap user and group is not existing on the target I searched 
for a way to let the openldap package add the user and group to the 
target filesystem. The buildroot documentation describes in chapter 23 
the syntax of "makeusers". So far so good, but I have no idea to which 
file I should add the corresponding makeusers command.

I grepped the buildroot tree for an example but unfortunately did not 
found a package using this command.

Does anybody have an example how to do this.

Regards,
Andreas
