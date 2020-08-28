From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:09:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/ripgrep: fix debug build
In-Reply-To: <20200822182237.1834735-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 22 Aug 2020 20:22:37 +0200")
References: <20200822182237.1834735-1-fontaine.fabrice@gmail.com>
Message-ID: <87imd2puhz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > There is no --debug mode for cargo resulting in the following build
 > failure since the addition of this package with commit
 > 4b0d1ef6ac00c5170a3fb9d15d06b3d3172e0c97:

 > error: Unknown flag: '--debug'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/58e74bb056ec65680ecebaa559aa14bdebbf5c85
 >  - http://autobuild.buildroot.org/results/28c6364a89a6044d5a036614f7a6e59815efb770

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
