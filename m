From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Sep 2019 09:24:19 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-09-01
In-Reply-To: <CAFOYHZA-v1OeAoWcN1tZr6eF7oD5pD7rTMpCcnL2dtN6nwOu4w@mail.gmail.com>
References: <5d6cb406.1c69fb81.71217.d243SMTPIN_ADDED_MISSING@mx.google.com>
 <CAFOYHZA-v1OeAoWcN1tZr6eF7oD5pD7rTMpCcnL2dtN6nwOu4w@mail.gmail.com>
Message-ID: <20190905092419.2a23fe05@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

On Thu, 5 Sep 2019 12:46:01 +1200
Chris Packham <judge.packham@gmail.com> wrote:

> >              name              | found by |        link to release-monitoring.org        |   version    |   upstream
> > -------------------------------+----------+----------------------------------------------+--------------+--------------
> >                       eventlog |  GUESS   | https://release-monitoring.org/project/14684 | 0.2.12       | 3.23.1
> >                      syslog-ng |  GUESS   | https://release-monitoring.org/project/04930 | 3.22.1       | 3.23.1  
> 
> Any way we can feedback to release-monitoring about eventlog. They
> seem to be tracking the syslog-ng version but actually eventlog 0.2.13
> is the latest (not that I can find a working download link for it).
> 
> I'll look at another bump for syslog-ng (I know the last one was only
> just applied).

release-monitoring.org is like a Wiki: anyone with an account can add
and modify projects.

However, for eventlog, how does one know about new versions ? The
Github repo at https://github.com/balabit/eventlog doesn't have any
tags, and the HTTP URL https://my.balabit.com/downloads/eventlog/ that
we use in eventlog.mk does not have listing enabled. So, there doesn't
seem to be a useful way for release-monitoring.org to detect the new
versions available.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
