From: Robert B. Williams <rwilliams@valcom.com>
Date: Thu, 17 Jul 2008 11:17:04 -0400
Subject: [Buildroot] SVN guidance request
Message-ID: <487F6270.1090301@valcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am very new to buildroot.  Nice work!

Anyway, I would like some advice on how to best version control 
buildroot with my work.

I was hoping to put buildroot and the multiple projects I create with it 
in an SVN repository.  I'll need to be able to merge releases from 
buildroot from time to time while maintaining my project related 
changes.  I am also considering saving the downloads, in case older 
versions become unavailable. 

The documentation indicates that any changes made to 
project_build_ARCH/root/ will be lost during a toolchain build.  Does 
this mean I will need to build everything once (or kill the process 
after the toolchain is built) and then update my 
project_build_ARCH/root/ from my repository and then build the project 
again?  Or is there a better approach to storing project specific root 
files?  I know alot of the common files could simply be stored in the 
target/generic/target_skeleton but what about the ones that differ 
between projects? 

If there is documentation, hints, faqs, wiki, or any experience in this 
areas please let me know.

In the meantime I'll start experimenting.

Cheers!
