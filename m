From: Chris Robson <Chris.Robson@nrl.navy.mil>
Date: Tue, 12 Jan 2010 06:42:50 -0500
Subject: [Buildroot] Application package cross linked to package libraries
	problem
Message-ID: <4B4C603A.70104@nrl.navy.mil>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I'm looking for an example of how to package cross link to package 
libraries.  That is a package which is a library and then another 
package that links to that library.  I've built a package library with 
success (to include runtime install) and compiled a package application 
but getting the package application to link against the new package 
library is not working.  Obviously its a path issue but an example might 
help me see what is wrong with my setup.

Thanks....Chris
