From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 09:10:30 +0200
Subject: [Buildroot] [PATCH 4/5] gtest: Upgrade to GitHub HEAD
In-Reply-To: <561ED08C.5010301@softiron.co.uk>
References: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>
 <1444859483-2268-5-git-send-email-alan@softiron.co.uk>
 <20151014235522.774491e2@free-electrons.com>
 <561ED08C.5010301@softiron.co.uk>
Message-ID: <20151015091030.2f7272ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alan Ott,

On Wed, 14 Oct 2015 18:00:44 -0400, Alan Ott wrote:

> > So gtest and gmock are in fact now part of the same repository/upstream
> > project ? If that's the case, then I think we should simply get rid of
> > the gtest and gmock packages, and have a single package named
> > "googletest".
> 
> Yes, that would probably be better. gmock depends on gtest, and gtest 
> can be standalone. Maybe we have one package with a submenu option to 
> build each target (and a dependency so gmock selects gtest).
> 
> Is that ok by you?

Yes, that's OK.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
