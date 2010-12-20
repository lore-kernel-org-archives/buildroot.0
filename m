From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Mon, 20 Dec 2010 12:37:27 +0100
Subject: [Buildroot] [PATCH v2] buildroot:download: Add option to
 download SVN or GIT repository with version control information.
In-Reply-To: <AANLkTimyNWZtc0+o0hGsJj65pzLA-ge3RK9FOEMvNZj3@mail.gmail.com>
References: <1292492992-15797-1-git-send-email-sonic.adi@gmail.com>
	<20101217113436.43ec2958@surf>
	<AANLkTimyNWZtc0+o0hGsJj65pzLA-ge3RK9FOEMvNZj3@mail.gmail.com>
Message-ID: <AANLkTikGADXeh2Z1VzQkAgvsqnuOGtVYdgXpe8WfbG+P@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> ?Allow the user to write a "local.mk" file that gets included before
>> ?any package .mk file. In this "local.mk" file, the user can define
>> ?variables such as DIRECTFB_OVERRIDE_SOURCE_DIR=/home/foobar/directfb/.
>> ?The package infrastructure would of course be modified to take into
>> ?account this new variable, and use the given directory as the source
>> ?tree to compile the DirectFB package.
>>
>> Again, that's a rough scheme, but at least it should solve your use
>> case, but also the use case brought by Mike who wanted to specify a
>> custom source tree for the kernel.
>>
>> Does that make sense ? Would it solve your use case ?
>
> Yes, this helps developers who has some separate local source trees.
> But it is not as convenient as automatically storing svn/git tree in
> download folder mentioned above, when you want to check out complete
> sources trees in a distribution at once. If this is something
> buildroot Makefile can help?

Another great benefit of setting path to local source trees, is that
you may want to do some trial and error without flooding your commit
log.
