From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 01 Oct 2012 16:56:42 +0300
Subject: [Buildroot] Questions abou PAM, cracklib and busybox adduser
Message-ID: <5069A11A.3060004@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all

I was just wondering if it makes sense to compile the new linux-pam
package that is now in buildroot
with cracklib support ?

I mean, doesn't the busybox adduser applet (or more like, passwd applet)
contain somekind of password strength checking
(CONFIG_FEATURE_PASSWD_WEAK_CHECK) option already ?

I wan't the best password strength checking possible so should I use
plain busybox with CONFIG_FEATURE_PASSWD_WEAK_CHECK enabled or
disable that and compile linux-pam with cracklib ?

Best regards:
Stefan

P.S:

Does anybody happen to have a nice patch to busybox deluser applet so
that it would support
the -r, --remove option (remove user home directory after user has been
removed  from /etc/passwd and /etc/shadow)
 like shadow package userdel command does ?

Im feeling soooo lazy today to start messing with
shadow-4.1.5.1/src/userdel.c and grokking how to add that to deluser
:-)






 
