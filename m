From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Jun 2017 17:58:01 +0200
Subject: [Buildroot] [PATCH] package/tslib: bump version to 1.11
In-Reply-To: <1e33fbf7-4a80-006b-4ec9-2dc11feb3b6b@ginzinger.com> (Martin
 Kepplinger's message of "Tue, 6 Jun 2017 17:47:55 +0200")
References: <20170606125009.26537-1-martin.kepplinger@ginzinger.com>
 <87bmq1cfce.fsf@dell.be.48ers.dk>
 <1e33fbf7-4a80-006b-4ec9-2dc11feb3b6b@ginzinger.com>
Message-ID: <8737bdcdme.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Kepplinger <martin.kepplinger@ginzinger.com> writes:

 > On 2017-06-06 17:20, Peter Korsgaard wrote:
 >>>>>>> "Martin" == Martin Kepplinger <martin.kepplinger@ginzinger.com> writes:
 >> 
 >> > Release notes for the curious:
 >> >    https://github.com/kergoth/tslib/blob/master/NEWS
 >> 
 >> Sorry, forgot to ask:
 >> 
 >> NEWS states:
 >> 
 >> This release includes the following bugfixes:
 >> * ff8c7d9 use dlfcn.h dynamic loading function only if libdl is available
 >> 
 >> 
 >> Does this mean that we can drop the dependency on !BR2_STATIC_LIBS?
 >> 

 > Yes. I planned to send this change when this is applied :)

Ahh, ok. For future reference, it is fine to include such changes in the
version bump change.

-- 
Bye, Peter Korsgaard
