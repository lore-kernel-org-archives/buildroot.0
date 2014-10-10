From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Oct 2014 08:35:51 +0200
Subject: [Buildroot] [PATCH 2/5] libgeotiff: fix static linking issue
In-Reply-To: <1412871048-28981-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 9 Oct 2014 18:10:45 +0200")
References: <1412871048-28981-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1412871048-28981-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87oatka0u0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a patch to improve the libgeotiff configure script to
 > use pkg-config to detect libtiff, which allows to properly take into
 > account dependant libraries such as libz and libjpeg.

 > As a consequence, we now autoreconf the libgeotiff package, and add
 > host-pkgconf as a dependency.

 > Fixes:

 >   http://autobuild.buildroot.org/results/649/6498d6516a412b12d68fa9f6a66172021abadc34/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks. Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
