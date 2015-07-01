From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 1 Jul 2015 10:53:15 +0200 (CEST)
Subject: [Buildroot] Buildroot runtime test infrastructure prototype
In-Reply-To: <5592FB74.3010608@andin.de>
Message-ID: <1195692444.2391852.1435740795287.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> I'd be interested, how is that different from the report.html that
> you
> mention below? What tools are you using?
> 

RFW can generate multiple outputs 

* html reports for human viewers
* output.xml which is a very complete XML report, but in a RFW specific
  format. That is the one I used to autogenerate my weekly reports
  and corresponding slides. I genereate some libreoffice files from
  parsing that data
* xunit.xml which contains very little information but is compatible
  with the standard. This is usefull to integrate with other tools
  that already know that format.

Overall, output.xml is the usefull output if you want to automatically
analyze test results. Since that was what I was doing, I used that file
