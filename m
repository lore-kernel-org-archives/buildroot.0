From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Mar 2015 23:24:50 +0100
Subject: [Buildroot] [PATCH] agentpp: update .hash file
In-Reply-To: <20150323191150.49f0f12c@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 23 Mar 2015 19:11:50 +0100")
References: <1427093537-28054-1-git-send-email-fabio.porcedda@gmail.com>
 <20150323191150.49f0f12c@free-electrons.com>
Message-ID: <87fv8vgxn1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> +sha512
 >> 636e19a7bbc3cfbf6f1ac10d29ddd378ca81b5525be1bd09c26a1cbd20ff9cfc3d4406329147bf20994f0d59bbdb675e99e82de3837eb898a145439c5054ef96
 >> agent++-4.0.3.tar.gz

 > I indeed see the problem, but the issue is that sources.buildroot.net
 > has already cached the previous version of the tarball, so this will
 > have to be handled.

I've deleted the tarball from sources.buildroot.net.

-- 
Bye, Peter Korsgaard
