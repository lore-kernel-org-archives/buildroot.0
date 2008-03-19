From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Wed, 19 Mar 2008 15:20:04 -0600
Subject: [Buildroot] [ PATCH ] adjust gnu download paths
Message-ID: <47E18384.6020106@gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some projects download from gnu mirrors, however the project.mk adds an 
extra /gnu thus causing a 404. The following patch removes all extra 
/gnu from packages using the BR2_GNU_MIRROR to define the project site 
variable.

On a side note, it has been a few years since I was actively involved in 
providing patches for buildroot, however I have another project coming 
up here where I expect to use buildroot quite a bit. How do I go about 
getting svn access for bugs/patches like this?

-- 
Nathanael D. Noblet
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gnu_path.diff
Type: text/x-patch
Size: 9046 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080319/b422a700/attachment.bin 
