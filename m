From: Ming-Ching Tiew <mingching.tiew@redtone.com>
Date: Wed, 30 Jan 2008 14:40:32 +0800
Subject: [Buildroot] diff two identical files
Message-ID: <0df101c8630b$03041b50$8119fea9@MingChing>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Using the crossed compiled 'diff' from the buildroot on the 
target system will hit error if the source and destination file
are identical :-

         # diff a b
memory exhausted

There is no error if a and b are slightly different. 

If I compile difftutils natively there is no problem.



--------------------------------------------
Important Warning! 

*************************** 

This electronic communication (including any attached files) may contain confidential and/or legally privileged information and is only intended for the use of the person to whom it is addressed. If you are not the intended recipient, you do not have permission to read, use, disseminate, distribute, copy or retain any part of this communication or its attachments in any form. If this e-mail was sent to you by mistake, please take the time to notify the sender so that they can identify the problem and avoid any more mistakes in sending e-mail to you. The unauthorised use of information contained in this communication or its attachments may result in legal action against any person who uses it.
