From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 21:44:06 +0200
Subject: [Buildroot] [PATCH 1/1] log4cplus: needs gcc >= 4.8
In-Reply-To: <20180529171929.9326-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 29 May 2018 19:19:29 +0200")
References: <20180529171929.9326-1-fontaine.fabrice@gmail.com>
Message-ID: <87r2lu4589.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > log4cplus needs std::map::emplace
 > Fixes:
 >  - http://autobuild.buildroot.net/results/ef0d8d7fae835ff555202f6de320945226ec00bf

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
