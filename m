From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 19 Apr 2013 19:05:38 -0400
Subject: [Buildroot] ccache problem when compiling with different
 toolchains in different projects
In-Reply-To: <CANxTyt7N+cKyvksZLSgUADMmgmhdfLBqYd=oRSxCVpKaWYEH1w@mail.gmail.com>
References: <CANxTyt7OWfG1U7yoTtRomKm2ECpC_cnxrGFbD8KVXFty==j7ig@mail.gmail.com>
 <CADzL+YjA_Zx0BCmWESKYnna=dGyf=3BY9pd00m-BhAbw-HG9TQ@mail.gmail.com>
 <5171AF1B.4010806@mind.be>
 <CANxTyt7N+cKyvksZLSgUADMmgmhdfLBqYd=oRSxCVpKaWYEH1w@mail.gmail.com>
Message-ID: <CANxTyt631uqe2dVNvSjDemU_vYuiCYWLg=0EL6PEJ+pS_eq=jQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> and then set the CCACHE_COMPILERCHECK to "echo
> $(STAMP_DIR)/toolchain-config-info.md5sum".  Then, the effects of all the
> hidden variables are in some way accounted for without grepping for them in
> the .config.\
>

Sorry, that should have been "cat", not "echo"  - as in 'set the
CCACHE_COMPILERCHECK to "cat $(STAMP_DIR)/toolchain-config-info.md5sum" '.

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130419/391736e2/attachment.html>
