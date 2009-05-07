From: Michael Roth <mroth@nessie.de>
Date: Thu, 07 May 2009 14:21:16 +0200
Subject: [Buildroot] [PATCH] .gitignore: Add download directory 'dl'
In-Reply-To: <200905070544.51649.markus.heidelberg@web.de>
References: <1241649940-16168-1-git-send-email-mroth@nessie.de>
	<200905070544.51649.markus.heidelberg@web.de>
Message-ID: <4A02D23C.309@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus Heidelberg schrieb:

> What about additionally adding /.config* ?
> I guess it's quite common to have some configs laying around.

Hmm, yes, but maybe different people use different names:
For example I'm using config.foobar and you're maybe using
.config.foobar and others maybe using foobar.config etc.

So I don't think, there exists a global rule for custom .config
file names.


Michael
