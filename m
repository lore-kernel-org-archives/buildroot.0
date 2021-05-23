From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 20:37:09 +0200
Subject: [Buildroot] [PATCH v2] package/dhcp: add host-gawk optional
 dependency
In-Reply-To: <20210507094304.21719-1-heiko.thiery@gmail.com> (Heiko Thiery's
 message of "Fri, 7 May 2021 11:43:05 +0200")
References: <20210507094304.21719-1-heiko.thiery@gmail.com>
Message-ID: <878s4547qi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > On hosts where gawk is not available, it is not possible to build the
 > package with server option (BR2_PACKAGE_DHCP_SERVER).
 > The build goes through without errors but the binaries are not created
 > and installed. The reason is that autotools cannot find gawk.

 > Fixes: Bug 13781

 > Reported-by: Kay Jeschonneck <kay.jeschonneck@airbus.com>
 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
 > ---
 > v2:
 >  - set to correct bug number

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
