From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 09 Nov 2019 18:46:49 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/domoticz: fix build with RELRO
In-Reply-To: <20191108170445.29361-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 8 Nov 2019 18:04:45 +0100")
References: <20191108170445.29361-1-fontaine.fabrice@gmail.com>
Message-ID: <87h83dkkmu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/5c1ca3083ad672401d1e050c6c3a07b8c33b851d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Retrieve upstream patch that adds -c as suggested by Arnout during
 >    review of v1

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
