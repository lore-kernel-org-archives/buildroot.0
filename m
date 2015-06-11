From: =?UTF-8?B?Q8OpZHJpYyBNYXJpZQ==?= <cedric.marie@openmailbox.org>
Date: Thu, 11 Jun 2015 23:20:13 +0200
Subject: [Buildroot] [PATCH] directfb: add an option for debugging
	support
In-Reply-To: <5579F071.40802@mind.be>
References: <1433882623-15782-1-git-send-email-cedric.marie@openmailbox.org>	<5578AFEC.4020107@mind.be>
 <339271dfef37197a3b13ecbd8222c28a@openmailbox.org> <5579F071.40802@mind.be>
Message-ID: <5579FB8D.1020509@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 11/06/2015 22:32, Arnout Vandecappelle a ?crit :
>   Yes, but I was in fact mainly talking about the help text of the new option.

Oops, sorry.
But I suppose I shouldn't give so much details in the help text, as in 
the commit message.
What do you think is important to mention?

Here is a proposal, feel free to comment/modify:

Compile DirectFB with debugging support. It provides functions to print 
debug information, for DirectFB as well as external DirectFB drivers.
When disabled, DirectFB has got no debug feature at all, and the 
directory that contains the internal libraries is suffixed with -pure
(/usr/lib/directfb-<version>-pure/).


NB: I'm not really satisfied with "internal libraries", but I can't find 
the right expression for that. It contains gfx drivers, but not only...


-- 
C?dric
