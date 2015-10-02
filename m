From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Oct 2015 16:39:55 +0200
Subject: [Buildroot] [PATCH] libssh: needs shared library support
In-Reply-To: <5f49edd9ffc4715859e0f344ff38d11bda3cd876.1443720785.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 1 Oct 2015 20:33:05 +0300")
References: <5f49edd9ffc4715859e0f344ff38d11bda3cd876.1443720785.git.baruch@tkos.co.il>
Message-ID: <8737xtibb8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > libssh builds libssh.so unconditionally.
 > Fixes:
 > http://autobuild.buildroot.net/results/7c7/7c7da08c71b5378b68631e3844088307080f6f9e/
 > http://autobuild.buildroot.net/results/a19/a19c619f4561f5426236b958f09cab4c095a63cc/
 > http://autobuild.buildroot.net/results/d6d/d6dd4a9b787d654b4173c03174a2fd72bdc017b3/

 > and more.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
