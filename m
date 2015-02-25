From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Feb 2015 11:02:38 -0300
Subject: [Buildroot] Large changesets
In-Reply-To: <20150224104300.GA24526@vostro>
References: <20150224104300.GA24526@vostro>
Message-ID: <54EDD5FE.2080908@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/24/2015 07:43 AM, Alex Suykov wrote:

> What's the best way to submit a relatively large patchset for review?
> Especially considering there may be v2, v3 etc.
> 
> I'm working on some init-related stuff, and the first stage there is
> moving service file installation code (that's /etc/init.d/*, *.service)
> out of project .mk files and into pkg-generic.mk.
> 
> So there's one patch that does pkg-generic changes, followed by one
> patch per package for each package that has service files, that's 70+
> patches already, a bit too much to post right away I think.

Hi.
Well, send it to the mailing list, the usual way here :)
If the changes to the packages are all of the same kind, for instance
because of infra move in the first patch or so you could send them all
together.
Something like "Convert package sysv initscripts to new format" and
another one of systemd service files.
Regards.
