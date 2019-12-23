From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 09:07:42 +0100
Subject: [Buildroot] [PATCH] package/efl: drop invalid select
 BR2_PACKAGE_XLIB_LIBXP
In-Reply-To: <20191213141602.1357200-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 13 Dec 2019 15:16:01 +0100")
References: <20191213141602.1357200-1-thomas.petazzoni@bootlin.com>
Message-ID: <871rsvxy5t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The option BR2_PACKAGE_XLIB_LIBXP does not exist, but is select by
 > efl/Config.in since the package was introduced. Since all xlib_*
 > dependency in the .mk file each have a corresponding select in the
 > Config.in file, we simply drop this bogus dependency.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
