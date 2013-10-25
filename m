From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 25 Oct 2013 10:52:54 -0500
Subject: [Buildroot] [RFC] pkg-python infrastructure
Message-ID: <OFCFB88498.0047424B-ON86257C0F.0057371F-86257C0F.0057386F@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A while back (about a week ago) - Gustavoz Zacarias, Thomas Petazzoni, and 
myself - were having a conversation on the IRC about creating a new 
package type for handling the builds of python packages. If I recall 
correctly, this is what we discussed. I would like to just have some 
record on how we want to handle building python packages.

Thomas P and Gustavoz - please correct/expand on any points that I may be 
missing.

pkg-python infrastructure
-------------------------

 * Would add a new makefile defining generic build steps for python 
packages under package/pkg-python.mk.

 * Would support building for Python 2.7 and Python 3+.

 * Would ensure that cross-compiling of python packages is handled 
correctly.

 * Would support setup.py and setuptools packages.

I don't know when I will be able to get around to doing this but I would 
like to at least capture the points that were made. Also anyone else is 
welcome to pick up this work too :)

Thanks,
-Ryan

------------------------------------------------------------
Ryan J Barnett / Software Engineer / Platform SW
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
rjbarnet at rockwellcollins.com
www.rockwellcollins.com 
