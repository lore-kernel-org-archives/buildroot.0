From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Dec 2019 19:52:04 +0100
Subject: [Buildroot] [PATCH] package/postgresql: fix filesystem naming
 consistency
In-Reply-To: <b34b7020-ad95-4a3d-f9dc-25547198007f@mind.be> (Arnout
 Vandecappelle's message of "Sun, 1 Dec 2019 15:07:45 +0100")
References: <3057858685-24792@mail.unilogic.nl>
 <b34b7020-ad95-4a3d-f9dc-25547198007f@mind.be>
Message-ID: <87v9qzq3or.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hello,

 >> The whole point of having consistent naming between service and
 >> related directories is that you don't even have to look in the
 >> documentation where things are.
 >> 
 >> On a sidenote, PostgreSQL does look for
 >> /etc/postgresql/postgresql.conf regardless and not
 >> /etc/pgsql/pgsql.conf, so it's a bit of mess really...

 >  If these are the only reasons for changing the name, then I don't think it's
 > worth the bother of breaking existing systems.

Agreed.

-- 
Bye, Peter Korsgaard
