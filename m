From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 21:13:20 +0100
Subject: [Buildroot] [PATCH v2,
 2/2] package/leveldb: fix static build with -latomic
In-Reply-To: <20191227094000.374160-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 27 Dec 2019 10:40:00 +0100")
References: <20191227094000.374160-1-fontaine.fabrice@gmail.com>
 <20191227094000.374160-2-fontaine.fabrice@gmail.com>
Message-ID: <87r207jcin.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop workaround and use an upstreamable solution to link with -latomic
 > Fixes:
 >  - http://autobuild.buildroot.org/results/01d5a50581ac9e9b46f40e6f9665f74897db5e6f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
