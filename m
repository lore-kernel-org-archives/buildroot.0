From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Aug 2011 21:17:08 +0200
Subject: [Buildroot] [PATCH 4/9] fs/skeleton: add /etc/services entries for
	cyrus-imapd
In-Reply-To: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
References: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1314127033-14861-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 fs/skeleton/etc/services |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/services b/fs/skeleton/etc/services
index da37240..cb6b536 100644
--- a/fs/skeleton/etc/services
+++ b/fs/skeleton/etc/services
@@ -88,6 +88,7 @@ netbios-dgm	138/tcp				# NETBIOS Datagram Service
 netbios-dgm	138/udp
 netbios-ssn	139/tcp				# NETBIOS session service
 netbios-ssn	139/udp
+imap		143/tcp
 imap2		143/tcp				# Interim Mail Access Proto v2
 imap2		143/udp
 snmp		161/udp				# Simple Net Mgmt Proto
@@ -126,18 +127,21 @@ imap3		220/tcp				# Interactive Mail Access
 imap3		220/udp				# Protocol v3
 ulistserv	372/tcp				# UNIX Listserv
 ulistserv	372/udp
+imsp		406/tcp
 https		443/tcp				# MCom
 https		443/udp				# MCom
 snpp		444/tcp				# Simple Network Paging Protocol
 snpp		444/udp				# Simple Network Paging Protocol
 saft		487/tcp				# Simple Asynchronous File Transfer
 saft		487/udp				# Simple Asynchronous File Transfer
+nntps		563/tcp
 npmp-local	610/tcp		dqs313_qmaster	# npmp-local / DQS
 npmp-local	610/udp		dqs313_qmaster	# npmp-local / DQS
 npmp-gui	611/tcp		dqs313_execd	# npmp-gui / DQS
 npmp-gui	611/udp		dqs313_execd	# npmp-gui / DQS
 hmmp-ind	612/tcp		dqs313_intercell# HMMP Indication / DQS
 hmmp-ind	612/udp		dqs313_intercell# HMMP Indication / DQS
+pop3s		995/tcp
 #
 # UNIX specific services
 #
@@ -163,10 +167,15 @@ afpovertcp	548/udp				# AFP over TCP
 remotefs	556/tcp		rfs_server rfs	# Brunhoff remote filesystem
 klogin		543/tcp				# Kerberized `rlogin' (v5)
 kshell		544/tcp		krcmd		# Kerberized `rsh' (v5)
+acap		674/tcp
 kerberos-adm	749/tcp				# Kerberos `kadmin' (v5)
 #
 webster		765/tcp				# Network dictionary
 webster		765/udp
+imaps		993/tcp
+sieve		2000/tcp
+lmtp		2003/tcp
+fud		4201/udp
 #
 # From ``Assigned Numbers'':
 #
-- 
1.7.4.1
