From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Sep 2015 13:42:45 +0200
Subject: [Buildroot] [PATCH] mosquitto: bump version
In-Reply-To: <56091CC9.9040408@imgtec.com> (Vicente Olivert Riera's message of
 "Mon, 28 Sep 2015 11:56:09 +0100")
References: <1443386958-24125-1-git-send-email-peter@korsgaard.com>
 <56091CC9.9040408@imgtec.com>
Message-ID: <87zj06ixca.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Dear Peter Korsgaard,
 > I think is a good habit to write the version number in the subject, so
 > someone using "git log --oneline" would be able to see to which version
 > number are you bumping :P

OK, I can do that. We currently have a bit of a mix between 'bump
version' and 'bump version to x.y.z', but we can start to encourange
people to use the 2nd form:

git log --format=oneline --grep 'ump version$' | wc -l
760
git log --format=oneline --grep 'ump version to ' | wc -l
655

-- 
Venlig hilsen,
Peter Korsgaard 
