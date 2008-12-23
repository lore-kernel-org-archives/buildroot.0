From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 23 Dec 2008 15:45:09 +1100
Subject: [Buildroot] svn server key change?
Message-ID: <20081223044509.GA7307@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[ 3:36PM] hamish at bach $ svn update
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@       WARNING: POSSIBLE DNS SPOOFING DETECTED!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
The RSA host key for svn.uclibc.org has changed,
and the key for the corresponding IP address 140.211.167.224
is unknown. This could either mean that
DNS SPOOFING is happening or the IP address for the host
and its host key have changed at the same time.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle
attack)!
It is also possible that the RSA host key has just been changed.
The fingerprint for the RSA key sent by the remote host is
c7:ad:f8:f2:60:23:be:b1:e9:44:8f:ab:62:ee:59:f8.
Please contact your system administrator.
Add correct host key in /home/hamish/.ssh/known_hosts to get rid of this message.
Offending key in /home/hamish/.ssh/known_hosts:12
RSA host key for svn.uclibc.org has changed and you have requested
strict checking.
Host key verification failed.
svn: Connection closed unexpectedly

Ouch. Can someone please confirm this is intentional?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
