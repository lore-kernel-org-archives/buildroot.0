From: Davide Viti <zinosat@tiscali.it>
Date: Thu,  6 Dec 2012 23:46:11 +0100
Subject: [Buildroot] [PATCH - v3] tcllib: new package
Message-ID: <1354833972-17700-1-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As dicussed on IRC, here follows another update:

 - Set TCLLIB_LICENSE to "tcllib license"
   DESCRIPTION.txt says "Rights: BSD" without specifying the BSD clause
 - remove "tcl" from the list of dependencies, since "tcllib" can be
   selected only if tcl has been selected
