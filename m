From: Neale Pickett <neale@lanl.gov>
Date: Tue, 14 Aug 2012 10:16:01 -0600
Subject: [Buildroot] Workaround: git clone with http not giving me commits
	after Jul 6
In-Reply-To: <20120813135640.7735d625@cfl-science.lanl.gov>
References: <20120813121005.3aeda200@cfl-science.lanl.gov>
 <502958DC.3050705@googlemail.com>
 <20120813135640.7735d625@cfl-science.lanl.gov>
Message-ID: <20120814101601.47399f01@cfl-science.lanl.gov>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I heard back that the problem is, in fact, update-server-info not
running on commit.  It is supposed to be resolved soon.

In the meantime, cgit (the git web interface used at busybox.net) also
supports checkout over HTTP.  So you can use this:

    git clone http://git.buildroot.net/buildroot/

To fetch the latest over HTTP.  Until the site admins disable it :)

Neale

-- 
Neale Pickett <neale@lanl.gov>
Advanced Computing Solutions, Los Alamos National Laboratory
