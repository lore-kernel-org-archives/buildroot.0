From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Dec 2010 22:04:43 +0100
Subject: [Buildroot] [PATCH 00/10] Toolchain rework, take 3
In-Reply-To: <4D1B9D5F.4090901@zacarias.com.ar> (Gustavo Zacarias's message of
	"Wed, 29 Dec 2010 17:43:11 -0300")
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
	<87y679j8md.fsf@macbook.be.48ers.dk>
	<4D1B9D5F.4090901@zacarias.com.ar>
Message-ID: <87d3okjno4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 12/29/10 05:17, Peter Korsgaard wrote:
 >> Thanks. Committed first 3 (up to binutils). Care to respin the rest of
 >> the series? Maybe patch 9 should get merged with the main binutils patch
 >> as well.

 Gustavo> Respined.
 Gustavo> They're at the usual git://repo.or.cz/buildroot-gz.git toolchain-rework
 Gustavo> branch.
 Gustavo> Give them a spin to see if there's anything big i missed before sending
 Gustavo> a ton of email again ;-)

Thanks, but we're down to 6 patches now so it's no loner a ton ;)

I see that you are still hiding the BR2_PACKAGE_BINUTILS option, why is that?

-- 
Bye, Peter Korsgaard
