From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jul 2010 10:16:17 +0200
Subject: [Buildroot] (no subject)
In-Reply-To: <17253.16630.qm@web180214.mail.gq1.yahoo.com> (Dwayne Fontenot's
	message of "Thu, 29 Jul 2010 15:44:45 -0700 (PDT)")
References: <17253.16630.qm@web180214.mail.gq1.yahoo.com>
Message-ID: <87ocdpl6zy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dwayne" == "Dwayne Fontenot <dwayne.fontenot@att.net>" <dwayne.fontenot@att.net> writes:

 Dwayne> Hello,

 Dwayne> With the help of y_morin in #uclibc I found this patch allows a
 Dwayne> powerpc NPTL build to complete.

 Dwayne> Without this patch, buildroot git HEAD would fail on libgomp with:

Thanks. I committed a similar patch already as it also broke x86-64
builds.

-- 
Bye, Peter Korsgaard
