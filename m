From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 May 2015 16:33:34 +0200
Subject: [Buildroot] [PATCH 2/2] poppler: help finding libtiff in static
	linking scenarios
In-Reply-To: <1430660473-6997-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 May 2015 15:41:13 +0200")
References: <1430660473-6997-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1430660473-6997-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871tixu3wh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In static linking scenarios, poppler doesn't find libtiff because it
 > doesn't use pkg-config, so it doesn't know which additional libraries
 > it should link with to test the availability of libtiff. We help
 > poppler in this work by passing a LIBTIFF_LIBS variable, resulting for
 > a pkg-config invocation.

 > Also, since poppler uses pkg-config, we make this dependency explicit
 > in this patch, even though it was already carried by the fontconfig
 > dependency.

 > Fixes:

 >   http://autobuild.buildroot.org/results/be7/be78957dd852233c81bd364ddf664564ce8f0208/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
