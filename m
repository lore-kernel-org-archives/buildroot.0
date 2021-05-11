From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 09:31:22 +0200
Subject: [Buildroot] [PATCH] support/testing: add sudo package test
In-Reply-To: <f5d85540-5ea8-f0dd-7de7-3e31cae0923f@mind.be> (Arnout
 Vandecappelle's message of "Tue, 11 May 2021 09:17:57 +0200")
References: <20210505191344.2108832-1-arnout@mind.be>
 <875yzqs5vu.fsf@dell.be.48ers.dk>
 <f5d85540-5ea8-f0dd-7de7-3e31cae0923f@mind.be>
Message-ID: <87sg2trak5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> initrd, so that implies writable rootfs - So we don't really need those
 >> special adduser flags, but OK.

 >  I'm not sure what you mean. Do you mean the flags to use /tmp as a home
 > directory? There was a reason I added those for a reason I think, but I forgot
 > why :-(

Yes, exactly. When I saw those flags I thought you were trying to make
it work with a read only rootfs, but given the cpio that cannot have
been it.

Anyway, this works.

-- 
Bye, Peter Korsgaard
