From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Nov 2017 19:58:04 +0100
Subject: [Buildroot] [PATCH 1/1] ntp: no longer require openssl
In-Reply-To: <20171108180310.144957c1@windsurf> (Thomas Petazzoni's message of
 "Wed, 8 Nov 2017 18:03:10 +0100")
References: <20171107212906.31336-1-Adamduskett@outlook.com>
 <20171108114348.491097e5@windsurf> <87fu9peysf.fsf@dell.be.48ers.dk>
 <20171108180310.144957c1@windsurf>
Message-ID: <87tvy4egxv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Yes. I've just applied it. I will also cherry pick to the LTS branch.

 > Be careful if you cherry-pick in the LTS branch: it depends on p10
 > version of ntp, which was committed after 2017.02 was released. I
 > haven't looked if the p10 bump has already been cherry-picked in the
 > LTS branch.

Indeed. I normally try to not apply backports out of order / skip
patches to not end up in untested configurations, but thanks for the
heads up!

-- 
Bye, Peter Korsgaard
