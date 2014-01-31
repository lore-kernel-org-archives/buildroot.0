From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 31 Jan 2014 09:41:29 +0100 (CET)
Subject: [Buildroot] [PATCH v3 1/6] Makefile: introduce BR2_PATH
In-Reply-To: <20140131092519.787a1f4d@skate>
Message-ID: <1114084693.4927201.1391157688997.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> I am wondering about the name BR2_PATH. Normally, BR2_<something> is
> used for variables coming from Kconfig options. Introducing the
> BR2_PATH variable, which doesn't come from a Kconfig option seems to
> violate this unwritten rule.
> 

as a side note, BR2_EXTERNAL also violates that rule...

BR2_EXTERNAL is still an unreleased feature so if this rule becomes
official there is still time to rename...
