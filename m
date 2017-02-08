From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Feb 2017 13:18:32 +0100
Subject: [Buildroot] [PATCH v5 01/19] reproducible: fix DATE/TIME macros
	in toolchain-wrapper
In-Reply-To: <2610985.18vsFpMzc5@sagittea> (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Wed, 08 Feb 2017 11:07:07 +0100")
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-2-git-send-email-jezz@sysmic.org>
 <87k291rawq.fsf@dell.be.48ers.dk> <2610985.18vsFpMzc5@sagittea>
Message-ID: <87o9ycq3jb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

Hi,

 >> I'm not sure this detailed error handling is really needed, but OK.

 > In fact I copy-paste get_source_date_epoch() from gcc git. So toolchain
 > wrapper will produce exactly same error messages than upstream gcc
 > (and it include same coding style error :-) ).

Yes, I noticed that later on as well (which is why I added the reference
to gcc git).

-- 
Bye, Peter Korsgaard
