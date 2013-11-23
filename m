From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 23 Nov 2013 21:38:45 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-22
In-Reply-To: <20131123073002.EA89E101432@stock.ovh.net>
References: <20131123073002.EA89E101432@stock.ovh.net>
Message-ID: <52911255.3030207@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I tried to reproduce the following build failures:

powerpc |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/b6f619f9c249fc653dc65f0f516cb846683700bb/
arm     |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/7e4/7e4e369dc5640619e95983ad0b4571f3a3f0d84b/
(also on i686 last week...)

I have not been able to reproduce this error...
I simply found a missing dependency on libltdl

Any Idea ?

Best regards,
-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
