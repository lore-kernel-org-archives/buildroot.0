From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Jul 2010 22:07:10 +0200
Subject: [Buildroot] [git commit master 1/1] qt: fix mysql dependency
	and disable unavailable sql drivers
In-Reply-To: <20100718184757.01b055f8@surf> (Thomas Petazzoni's message of
	"Sun, 18 Jul 2010 18:47:57 +0200")
References: <20100716215737.0F39682A80@busybox.osuosl.org>
	<20100718184757.01b055f8@surf>
Message-ID: <87lj98wo41.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> On Fri, 16 Jul 2010 23:55:30 +0200
 Thomas> Peter Korsgaard <jacmet@sunsite.dk> wrote:

 >> We don't have the needed dependencies in BR for most of the SQL
 >> drivers, so mark those options as broken.

 Thomas> I had already sent a fix for the Qt->MySQL dependency on Friday, at
 Thomas> 11:18 AM, together with a bump of the MySQL version (which allows MySQL
 Thomas> to actually build here) and other fixes as well.

Sorry, I'm ~250 mails behind on the BR list :/

The existing mysql version builds here, but a bump is find.

 Thomas> I will rebase my changes on top of yours and resend.

Not needed - I committed everything besides the Qt patch.

-- 
Bye, Peter Korsgaard
