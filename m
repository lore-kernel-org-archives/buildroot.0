From: Shawn Rose <sr@ecoventsystems.com>
Date: Thu, 29 Jan 2015 18:42:24 -0500
Subject: [Buildroot] Package python-pyxml missing?
Message-ID: <54CAC560.5060407@ecoventsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Is the python-pyxml package suppose to be included in the latest builds?
 I just did a git clone git://git.busybox.net/buildroot and the package
buildroot/package/python-pyxml is missing.  I also do not see it on
http://git.buildroot.net/buildroot/ on the master branch.

Why I ask is my python-setuptools crashes on for me when I use any of
its functionality with the error ImportError: No module named
xml.dom.pulldom   I believe this is due to my python xml package being
missing.

V/R,
-Shawn

-- 
Shawn Rose
Co-founder and CIO
(857) 293-9675
shawn at ecoventsystems.com
www.ecoventsystems.com
