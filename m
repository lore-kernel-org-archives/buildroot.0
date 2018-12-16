From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:12:50 +0100
Subject: [Buildroot] [PATCH] package/wine: host-wine also needs bison
 and flex
In-Reply-To: <20181211162830.1845-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 11 Dec 2018 17:28:30 +0100")
References: <20181211162830.1845-1-thomas.petazzoni@bootlin.com>
Message-ID: <87bm5l6ur1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Just like the build of the target wine, the build of host wine also
 > needs bison and flex, otherwise the build fails with:

 > checking for flex... no
 > configure: error: no suitable flex found. Please install the 'flex' package.

 > (and similarly for bison once host-flex is provided)

 > This was detected using per-package directories.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
