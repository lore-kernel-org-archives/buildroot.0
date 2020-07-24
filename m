From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Jul 2020 16:43:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11vnc: fix build with 64 bits
 time_t
In-Reply-To: <20200721200940.2775422-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 21 Jul 2020 22:09:40 +0200")
References: <20200721200940.2775422-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8o50y8k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/75e45b566c85d19c5ed00529d036b4808413b1ca

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.05.x (2020.02.x does not have the new musl release), thanks.

-- 
Bye, Peter Korsgaard
