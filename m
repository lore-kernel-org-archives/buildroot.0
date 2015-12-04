From: Andreas Ehmanns <universeii@gmx.de>
Date: Fri, 4 Dec 2015 09:13:12 +0100
Subject: [Buildroot] Move openldap package and enable LDAP server?
Message-ID: <56614B18.4030703@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,
I was going to use openLDAP on my embedded device and found the 
configuration under Target Packages -> Libraries -> Networking.
You can enable openldap which only generates the ldap libraries but have 
an option to let the client applications being built.
Since I need the LDAP server I added an option to compile the LDAP 
server too. Everything works fine and I thought about submitting the 
patch but then I asked me if the configuration location is still the 
right place.
Wouldn't it be better to place the openldap configuration under
Target Packages -> Networking Applications
instead of
Target Packages -> Libraries -> Networking

What is your opinion?

Regards,
Andreas Ehmanns
