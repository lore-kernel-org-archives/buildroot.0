From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2020 09:13:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/midori: needs gcc >= 7
In-Reply-To: <20200421172632.4124853-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 21 Apr 2020 19:26:32 +0200")
References: <20200421172632.4124853-1-fontaine.fabrice@gmail.com>
Message-ID: <87lfm2ucep.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit ec1ff802df9a0f17dd2b734ba536a5e206aa5aa4 forgot to propagate
 > gcc >= 7 dependency to midori

 > Fixes:
 >  - http://autobuild.buildroot.org/results/736a99dcaa72fba3f06775d08c4395f506fce944

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
