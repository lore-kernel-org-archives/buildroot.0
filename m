From: Matthew Davison <matt.davison@lantronix.com>
Date: Tue, 8 Jun 2010 15:36:36 -0700
Subject: [Buildroot] How to set file ownership prior to JFFS2 root
	filesystem generation
Message-ID: <8128F0FD6C26E14C8EB4BFDB92B8D6B201517E08@2putt.int.lantronix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I would like to create a home directory on the target and set its
ownership to the uid of a user that will also be present on the target.
I've noticed that something like this is already happening for the
/home/default directory, but I have been unable to determine how. In
general, how do you set the ownership of a file prior to JFFS2 root
filesystem generation?
 
Thanks for your help.
 
Matt
 
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the person or entity to which it is addressed and may contain information that is privileged, confidential, or otherwise protected from disclosure. Distribution or copying of this e-mail, or the information contained herein, to anyone other than the intended recipient is prohibited.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100608/b54baab6/attachment.html>
