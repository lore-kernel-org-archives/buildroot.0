From: Erik Andersen <andersen@codepoet.org>
Date: Tue, 3 Oct 2006 12:41:06 -0600
Subject: [Buildroot] svn commit: trunk/buildroot/package/lsof
In-Reply-To: <20061003084035.GB4585@aon.at>
References: <20061002184043.0CF8D4856C@busybox.net>
	<20061003084035.GB4585@aon.at>
Message-ID: <20061003184106.GA3176@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue Oct 03, 2006 at 10:40:35AM +0200, Bernhard Fischer wrote:
> Looks like these need escaping too, no?
> 
> grep -rHl "patch-kernel.*[^\\]\*" *
> package/ed/ed.mk
> package/coreutils/coreutils.mk
> package/libpcap/libpcap.mk
> package/sysvinit/sysvinit.mk
> package/ruby/ruby.mk
> package/libglib12/libglib12.mk
> package/libgtk12/libgtk12.mk
> package/bash/bash.mk
> target/cloop/cloop.mk

Yup.  Only noticed this since I (foolishly?) put a file named
foo.patch under buildroot/ and wierd things started happening.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
