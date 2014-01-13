From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Jan 2014 09:59:18 +0100
Subject: [Buildroot] [PATCH] prevent recursion in %_defconfig rules
In-Reply-To: <713578016.3542538.1389603165287.JavaMail.root@openwide.fr>
 (Jeremy Rosen's message of "Mon, 13 Jan 2014 09:52:45 +0100 (CET)")
References: <713578016.3542538.1389603165287.JavaMail.root@openwide.fr>
Message-ID: <87mwj01cm1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jeremy" == Jeremy Rosen <jeremy.rosen@openwide.fr> writes:

 > ping ?
 > Cordialement 

I cannot reproduce it here (with make 3.81), and I don't understand the
French error message - But it looks sane, so committed, thanks.

-- 
Bye, Peter Korsgaard
