From: Marc Murphy <marcmltd@marcm.co.uk>
Date: Wed, 11 Oct 2017 11:00:11 +0000
Subject: [Buildroot] pre-built binary packages
Message-ID: <8AE4BE7D9622DF41B76E1AD887AA1A477BB220F1@MARCM-SBS2011.marcmltd.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
I am wondering if it is possible to generate binary releases of packages to be included in the build tree.  For example I have a system that is rooted in 2017.02 and still has work done on some packages but when updating releases from other engineers the changes can get conflicted or messed up resulting in a fresh rebuild.  This normally isn't a problem until Qt is in the equation.  For me once Qt is configured built that's it I shouldn't need to build it again.  Is there any way to 
1) export or package the binaries and headers for module archiving
2) use the prebuilt binaries and headers in a new build to prevent having to rebuild Qt again

I think it could be a useful feature to create controlled releases or to speed up builds.

Thanks
Marc
