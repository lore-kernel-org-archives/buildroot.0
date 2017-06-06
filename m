From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Jun 2017 17:20:49 +0200
Subject: [Buildroot] [PATCH] package/tslib: bump version to 1.11
In-Reply-To: <20170606125009.26537-1-martin.kepplinger@ginzinger.com> (Martin
 Kepplinger's message of "Tue, 6 Jun 2017 14:50:09 +0200")
References: <20170606125009.26537-1-martin.kepplinger@ginzinger.com>
Message-ID: <87bmq1cfce.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Kepplinger <martin.kepplinger@ginzinger.com> writes:

 > Release notes for the curious:
 >    https://github.com/kergoth/tslib/blob/master/NEWS

Sorry, forgot to ask:

NEWS states:

This release includes the following bugfixes:
* ff8c7d9 use dlfcn.h dynamic loading function only if libdl is available


Does this mean that we can drop the dependency on !BR2_STATIC_LIBS?

-- 
Bye, Peter Korsgaard
