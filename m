From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jun 2018 13:59:22 +0200
Subject: [Buildroot] [PATCH 1/1] mosquitto: fix build with some glibc
In-Reply-To: <20180618180640.12324-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 18 Jun 2018 20:06:40 +0200")
References: <20180618180640.12324-1-fontaine.fabrice@gmail.com>
Message-ID: <87bmc7oulh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add patch to define _GNU_SOURCE before using S_IF{DIR,REG}
 > Fixes:
 >  - http://autobuild.buildroot.net/results/7dcfb6ca9d14a5cd6872590065549356f1ab42a0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
