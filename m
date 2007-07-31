From: Philippe Ney <philippe.ney@tizoo.com>
Date: Tue, 31 Jul 2007 11:45:31 +0200
Subject: [Buildroot] How to just build one application?
In-Reply-To: <522771.76217.qm@web15809.mail.cnb.yahoo.com>
References: <522771.76217.qm@web15809.mail.cnb.yahoo.com>
Message-ID: <20070731114531.729ead0d.philippe.ney@tizoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hello All,
> 
> I've installed  arm linux gcc 4.1.1 toolchains and I want to build uclibc samba with buildroot package. How can I skip building toolchains and just build samba package with the pre-installed toolchains ?
> 
> Thanks,

Hi,

$ make samba

You can build any target that is defined in a *.mk file by passing it
directly to the make call.

Philippe
