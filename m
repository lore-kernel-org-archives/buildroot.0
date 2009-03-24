From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Mar 2009 23:56:48 +0100
Subject: [Buildroot] using linux 2.4 headers
In-Reply-To: <49C9614C.6010205@caktusgroup.com> (Tobias McNulty's message of
	"Tue\, 24 Mar 2009 18\:40\:12 -0400")
References: <49C9614C.6010205@caktusgroup.com>
Message-ID: <877i2ejzrj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tobias" == Tobias McNulty <tobias@caktusgroup.com> writes:

Hi,

 Tobias> I just downloaded the latest version of buildroot and managed
 Tobias> to build a very small file system that includes python and
 Tobias> sqlite (exactly what I'm looking for!) in no time at all.
 Tobias> Very impressed, thanks for all your hard work everyone!

Thanks.

 Tobias> Now, pardon my ignorance, but is there a way to make
 Tobias> buildroot use linux 2.4 headers instead of the default 2.6?
 Tobias> I only have 2 options when I go to select the kernel headers,
 Tobias> and they're both fairly recent iterations of the 2.6 kernel.

The 2009.02 release had support for 2.4.41 if you go to build
options->Show packages that are deprecated or obsolete, but we have
removed it from subversion after the release.

Notice though that there aren't many people using the 2.4 support, so
something might not work ..

-- 
Bye, Peter Korsgaard
