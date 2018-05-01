From: Christian Stewart <christian@paral.in>
Date: Tue, 01 May 2018 16:56:14 -0400
Subject: [Buildroot] [PATCH 1/1] go: bump to 1.10
In-Reply-To: <87a7tjf8dr.fsf@dell.be.48ers.dk>
References: <20180219072718.28895-1-christian@paral.in>
 <87po3js3j3.fsf@dell.be.48ers.dk> <87y3i7q8fw.fsf@dell.be.48ers.dk>
 <877eoxc3uq.fsf@paral.in> <87a7tjf8dr.fsf@dell.be.48ers.dk>
Message-ID: <87sh7b2iz5.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Korsgaard <peter@korsgaard.com> writes:
> It probably isn't, but if the host uses glibc and the target you build
> for also uses glibc (and the same architecture), then it probably works
> to link with the target libc instead of the host one.

Agreed, but it's maybe worth noting that I'm successfully compiling on
amd64 targeting arm and arm64.

Best,
Christian
