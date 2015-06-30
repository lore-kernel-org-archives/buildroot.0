From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 10:46:38 +0200
Subject: [Buildroot] Buildroot runtime test infrastructure prototype
In-Reply-To: <1581556904.2327180.1435653528950.JavaMail.root@openwide.fr>
References: <20150630093903.4fd27ca5@free-electrons.com>
 <1581556904.2327180.1435653528950.JavaMail.root@openwide.fr>
Message-ID: <20150630104638.532e16f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy,

On Tue, 30 Jun 2015 10:38:49 +0200 (CEST), Jeremy Rosen wrote:

> We are in the process of reimplementing your examples in RFW to provide
> some food for thought, stay tuned...

Ok, good. Will be interesting to see.

> pretty good, RFW can report in an xunit-compatible xml which can be
> easily parsed by whatever tool you prefer. I have been autogenerating
> reports with it for quite some time
> 
> RFW also generates some HTML pages ready to be pushed on a server,
> but that's less usefull for the buildroot use-case.
> 
> An exemple of generated HTML can be found here:
> 
> http://robotframework.org/robotframework/latest/images/log_passed.html

Ok.

> > Can it run tests in parallel?
> 
> no, RFW core has no parallel testing capabilities by itself. There 
> are plugins to do that, though...

This is a very problematic thing. We will have lots of tests, and they
will be long. Not being able to run them in parallel is a big issue.

> > Can we
> > easily integrate the tests with Jenkins to have them run everyday?
> 
> RFW has its own jenkins plugin to harness test results. integration
> is very easy
> 
> the plugin is available here :
> 
> https://wiki.jenkins-ci.org/display/JENKINS/Robot+Framework+Plugin

This is good, however.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
