From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Sep 2011 22:19:24 +0200
Subject: [Buildroot] [PATCH 4/5] rtai: Install modules in
	/lib/modules/<version>/rtai
In-Reply-To: <77d33c8251975ea21d09773b6d8ce61c8bf45ff3.1316463052.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 19 Sep 2011 22:10:55 +0200")
References: <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
 <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
 <77d33c8251975ea21d09773b6d8ce61c8bf45ff3.1316463052.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87r53b2chf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The /lib/modules/<version>/kernel/ is completely rewritten by the
 Thomas> kernel module installation, so third party modules should be outside
 Thomas> of this directory.

Committed, thanks.

-- 
Bye, Peter Korsgaard
