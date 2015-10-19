From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Oct 2015 22:06:09 +0200
Subject: [Buildroot] [PATCH 1/1] Use portable shebangs (/bin/bash ->
	/usr/bin/env bash)
In-Reply-To: <1445272694-26156-1-git-send-email-bjorn.forsman@gmail.com>
 (=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Mon, 19 Oct 2015 18:38:14
 +0200")
References: <1445272694-26156-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <87mvve39ou.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

 > "/usr/bin/env bash" is used everywhere else in host tools. These are the
 > only remaining offenders.

 > Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
