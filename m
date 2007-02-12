From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:18 -0800
Subject: [Buildroot] [buildroot 0000268]: Documentation error? -
	target/default or target/generic?
Message-ID: <cea06e426ccacf473d83e800c9872b82@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=268 
====================================================================== 
Reported By:                acutetech
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   268
Category:                   Documentation
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-23-2005 09:00 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    Documentation error? - target/default or
target/generic?
Description: 
This page http://buildroot.uclibc.org/buildroot.html says this:

"Customize the target filesystem skeleton, available under
target/default/target_skeleton/". My system does not have
target/default/target_skeleton/ but it does have
target/generic/target_skeleton/ - is this a documentation error or should
there be both target/default and target/generic directories? (I always get
paranoid when reality differs from the documentation, because when
something doesn't work i don't know where to look - in this case if I have
problems is it beacuse I don't have a target/default directory, or is that
just out of date documenation?)

Also - you talk about the files target/default/device_table.txt and
target/default/skel.tar.gz - but I note that the devices and files in
target/generic/device_table.txt don't match what is in my build_mips/root.
So I guess that the root file system has NOT been built using this. 

Also - you imply that you can make changes in
target/default/target_skeleton/ (in actually in
target/generic/target_skeleton/ ??) and these will be carried over into
build_ARCH/root/ - How? By running the top-level make in the buildroot
directory? A tiny bit more info would be helpful to newbies. Thanks.

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 09-07-05 17:33  
---------------------------------------------------------------------- 
updated the docs to address everything you've mentioned here 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-23-05 09:00  acutetech      New Issue                                    
09-07-05 17:33  vapier         Note Added: 0000502                          
09-07-05 17:33  vapier         Status                   assigned => closed  
09-07-05 17:33  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
