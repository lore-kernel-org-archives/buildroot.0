From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Tue, 26 Aug 2008 07:13:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <87ej4bdg3x.fsf@macbook.be.48ers.dk>
References: <20080826121930.77B8B3C79C@busybox.net>
	<87k5e3gbne.fsf@macbook.be.48ers.dk> <20080826134856.GK2213@mx.loc>
	<87ej4bdg3x.fsf@macbook.be.48ers.dk>
Message-ID: <19162907.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I am more than happy to remove cups from the dependencies and the select in
Config.in
However I will wait to see if 'ninevoltz' has any thoughts.
If I hear nothing (give a few days) then I will tidy this up as I 100% agree
that we should have as few dependencies and selects as possible and only add
dependencies if packages have been chosen by users and the configure args
would change as a result.
Dan

-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package-libgtk2-tp19160871p19162907.html
Sent from the BuildRoot mailing list archive at Nabble.com.
