From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 27 Feb 2015 19:45:35 +0100
Subject: [Buildroot] error in skeleton  ?
Message-ID: <F7D7D32518D04BB5BEB5B0B4D484022D@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

In system/skeleton : the /dev/log is a symlink to /tmp/log  
I think this should be a symlink to /var/log 


Regards
Sagaert Johan
