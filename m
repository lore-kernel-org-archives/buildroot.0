From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Apr 2013 21:44:33 +0200
Subject: [Buildroot] Dropbear/SFTP
In-Reply-To: <1366918894609-44233.post@n4.nabble.com> (thomas's message of
 "Thu, 25 Apr 2013 12:41:34 -0700 (PDT)")
References: <002401cded96$e8b13fa0$ba13bee0$@co.uk>
 <20130108130618.4991dff7@skate>
 <1366918894609-44233.post@n4.nabble.com>
Message-ID: <87ip3a9yzi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "thomas" == thomas  <thomas.spitz@gmail.com> writes:

 thomas> Dear Thomas Petazzoni,

 thomas> I am in the same case as Ted Wood that is to say I can login
 thomas> using ssh from a console ("ssh root at 192.168.1.5") however I am
 thomas> not able to connect to SFTP server:("sftp root at 192.168.1.5"
 thomas> asks for a password but I got the following error : sh:
 thomas> /usr/libexec/sftp-server: not found Connection closed)

You need to use openssh or enable gesftpserver if you use dropbear.

-- 
Bye, Peter Korsgaard
