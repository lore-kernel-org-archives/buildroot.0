From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Dec 2009 20:50:09 +0100
Subject: [Buildroot] External toolchain: crosstool-NG instead of
	buildroot?
In-Reply-To: <hgfudc$e2$1@ger.gmane.org> (Grant Edwards's message of "Fri, 18
	Dec 2009 13:00:28 +0000 (UTC)")
References: <hgfudc$e2$1@ger.gmane.org>
Message-ID: <877hsh1l3i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

 Grant> The buildroot docs recommends using crosstool-NG to generate
 Grant> external toolchains.

 Grant> Is there some reason one shouldn't or can't use a toolchain
 Grant> generated buildroot?

No not at all. The reason for recommending crosstool-NG is simply that
it's a solution known to work, and we had some discussion about working
closer together with the crosstool-NG people, E.G. long term perhaps
getting rid of toolchain building in BR, and simply use crosstool-NG for
it.

-- 
Bye, Peter Korsgaard
