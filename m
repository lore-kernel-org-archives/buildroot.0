From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Tue, 29 Oct 2013 16:14:21 -0500
Subject: [Buildroot] [RFC] Continuous integration
In-Reply-To: <1464774.i3ScgRtXEf@sagittae>
References: <1464774.i3ScgRtXEf@sagittae>
Message-ID: <OF67614B25.FA9C8BC6-ON86257C13.00702AA5-86257C13.0074AB06@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, Thomas P, All,

I don't know what Jerome's plans are for his autobuilder, but I like the 
way that results are displayed on the links you provided below. It has 
colors and has nice features for sorting the results which make it easy 
for me to see the information I'm interested in rather quickly.

Thomas P - in your email entitled - Architecture build statistics - it 
would be nice to see a page where these statistics could displayed 
continuously. One idea that comes to be mind is that it would be nice if 
this autobuild site could aggregate the results from the current build 
infrastructure (maybe it already does). The website would then be able to 
provide these architecture statistic and package statistic break.

J?r?me Pouiller <jezz@sysmic.org> wrote on 10/25/2013 07:46:49 AM:

> I begin to wrote an autobuilder that would looks like that. You can sees
> results there : http://sysmic.org/~jezz/autobuilder/ (at beginning, it 
> was mainly for my personal needs)
> 
> It use a set of reference configurations which normally include all 
> packages (at least as much as possible). It compute list of packages and 

> their directories, list of targets for each configuration and 
> dependencies of of each packages for each configuration. It is able to 
> compute reverse dependencies and recursive dependencies.
> 
> Next, it ask to git modification time for each package directory. It is 
> able to detect couple of packages/configuration which build time is 
> older than package directory modification time.
> 
> It compute list of packages/configuration couple and sort it : never 
> built first, modified next, a dependency modified after and finally 
> other packages, ordered by last build time. Job queue is available 
> there: http://sysmic.org/~jezz/autobuilder/jobqueue.html (/!\ 4Mo).

I like the website and I know some of my colleagues are intrigued by this 
as this might provide an way to continuously test our changes across 
different architectures. Hopefully we have some time soon to investigate 
this.

Thanks,
-Ryan
