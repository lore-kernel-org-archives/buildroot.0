From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Jun 2013 21:16:32 +0200
Subject: [Buildroot] [PATCH] gutenprint: forcibly disable ijs-config
In-Reply-To: <1372437994-28897-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 28 Jun 2013 13:46:34 -0300")
References: <1372437994-28897-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8761wyyrjj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> ijs-config (ghostscript) is looked up in /usr/bin, if you've
 Gustavo> got a host that has ghostscript with development headers
 Gustavo> installed then the build fails when trying to link to the host
 Gustavo> libijs.  Forcibly disable ghostscript support since we lack a
 Gustavo> package.

Committed, thanks.

-- 
Bye, Peter Korsgaard
