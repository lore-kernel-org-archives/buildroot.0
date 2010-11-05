From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Nov 2010 10:21:52 +0100
Subject: [Buildroot] [PATCH 1/1] Remove support for shared configuration
	cache
In-Reply-To: <cc180c03ef4ac761ab7a25cb7935992e3c65db35.1288899072.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Thu, 4 Nov 2010 20:31:25 +0100")
References: <cover.1288899072.git.thomas.petazzoni@free-electrons.com>
	<cover.1288899072.git.thomas.petazzoni@free-electrons.com>
	<cc180c03ef4ac761ab7a25cb7935992e3c65db35.1288899072.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8739rg5dn3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The configuration cache shared between packages, while being in
 Thomas> principle a nice idea to speed-up the configuration of packages by
 Thomas> avoiding repetitive identical checks, turned out to be unreliable due
 Thomas> to the subtle differences between similar but not identical checks in
 Thomas> different packages. After spending some time trying to fix those, we
 Thomas> concluded that supporting the shared configuration cache is definitely
 Thomas> too hard and too unreliable, and that we'd better get rid of it
 Thomas> altogether.

 Thomas> This patch therefore removes the shared configuration cache
 Thomas> infrastructure and usage.

Committed, thanks.

-- 
Bye, Peter Korsgaard
