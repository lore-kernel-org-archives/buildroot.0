From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Aug 2016 10:34:13 +0200
Subject: [Buildroot] [PATCH 0/9 v2] musl: add compatibility cdefs.h
	header (branch yem/cdefs)
In-Reply-To: <20160819114027.33ffd63a@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 19 Aug 2016 11:40:27 +0200")
References: <cover.1471556612.git.yann.morin.1998@free.fr>
 <20160819114027.33ffd63a@free-electrons.com>
Message-ID: <87oa4lrym2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > This one, I am really really not sure. It's a whole lot of additional
 > complexity just to check a very specific problem. I'm not sure we want
 > to include such an additional complexity just for the sake of making
 > upstream packages "cdefs.h clean".

I agree, lets keep it KISS.

-- 
Bye, Peter Korsgaard
