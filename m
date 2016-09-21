From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 23:55:19 +0200
Subject: [Buildroot] CMAKE_SYSROOT issue [was: Re: [PATCH]
	toolchain-external: fix potential entire root filesystem removal]
In-Reply-To: <20160921192659.GD3405@free.fr> (Yann E. MORIN's message of "Wed, 
 21 Sep 2016 21:26:59 +0200")
References: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87k2edeay4.fsf@dell.be.48ers.dk>
 <fc0a0de7-398a-8b83-cf76-c4c0b031e01a@mind.be>
 <87y42tc4fl.fsf@dell.be.48ers.dk>
 <a4cc525b-c26a-fb0d-23c5-c72482377e95@mind.be>
 <87lgysdflp.fsf@dell.be.48ers.dk>
 <cb88e552-39e6-81fd-bf4f-b80d7cb59b7e@mind.be>
 <878tuscjlr.fsf@dell.be.48ers.dk> <20160921192659.GD3405@free.fr>
Message-ID: <87oa3grk8o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> >> [02/09 11:17:31] <smartin> cmake seems to split it like this:
 >> >> '--sysroot <STAGING_DIR> -I/urs/include' , i guess cmake does it
 >> >> because of/based on the CMAKE_SYSROOT.
 >> >> [02/09 11:17:57] <smartin> ^^^ is to be confirm with cmake developers
 >> >> [02/09 11:18:45] <smartin> but i wonder why it keep '-I/usr/include'
 >> >> since it is a standard location that gcc will check anyway
 >> >> [02/09 11:19:02] <smartin> ^^^ also, to be figured out with cmake developers
 >> 
 >> Samuel, did you hear back from the cmake devs?

 >> From what I recal, there was no issue with our cmake infra as it is now.

 > The problem lies in websocketpp's CMakeList.txt which is incorrect and
 > forcefully adds /usr/include.

 > I even sent a PR upstream to fix the issue:

 >     https://github.com/zaphoyd/websocketpp/pull/578

 > Unfortunately, it seems the websocketpp hasn't had any activity since
 > last February: no commit, no PR review, no comment on issues...

 > But there is now a patch that Pieter can use when he submits
 > websocketpp.

 > So, after discussing the issue on IRC with Samuel, I believe this is a
 > non-issue in our infra.

Ok, good to hear - Thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
