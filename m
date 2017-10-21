From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Oct 2017 08:18:26 +0200
Subject: [Buildroot] Autobuild.b.o status
In-Reply-To: <20171021080444.648fcfa1@windsurf> (Thomas Petazzoni's message of
 "Sat, 21 Oct 2017 08:04:44 +0200")
References: <20171021080444.648fcfa1@windsurf>
Message-ID: <87vaj9c9cd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > As several of you realized, autobuild.b.o had a problem yesterday.
 > Indeed, the server that hosts this (which is my own private server)
 > suffered a hard disk failure. The hard disk was replaced within an hour
 > after the incident, but of course it means the setup and data was lost.

 > Due to the size of the data involved in the autobuilders (gigabytes of
 > logs), I never bothered doing backups, so effectively the history of
 > build results is lost. Retrospectively, now that I realize that it
 > means all build result URLs that we embed in the commit logs are
 > broken, I think making a back up of those results does make sense.

Out of interest, how many gigabytes are we talking about approx?

 > Anyway, the previous results are lost. The current status is that the
 > MySQL database is up and running, as well as the web site (for both
 > viewing the results and submitting results). This was the minimal setup
 > I wanted to restore in order to start collecting results.

 > The main thing that remains to do is the e-mail notifications, which
 > currently won't happen. I will restore this as soon as possible.

 > It is of course an interesting illustration of Murphy's law to have
 > such a hard disk failure the day before the Buildroot Developers
 > meeting.

Indeed :/ Thanks for getting it up and running again so fast!

-- 
Bye, Peter Korsgaard
