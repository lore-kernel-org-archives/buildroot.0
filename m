From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Oct 2013 21:27:51 +0200
Subject: [Buildroot] [PATCH] setserial: bump to version 2.17-45.3
In-Reply-To: <20131001115508.502bffbc@skate> (Thomas Petazzoni's message of
 "Tue, 1 Oct 2013 11:55:08 +0200")
References: <1380609394.20990.0.camel@phoenix> <20131001115508.502bffbc@skate>
Message-ID: <87a9isvljc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Axel Lin,
 Thomas> On Tue, 01 Oct 2013 14:36:34 +0800, Axel Lin wrote:
 >> Bump to patchlevel 3 since 2 is gone upstream.
 >> 
 >> Signed-off-by: Axel Lin <axel.lin@ingics.com>

 Thomas> I believe we should get rid of the BR2_DEBIAN_MIRROR thing altogether,
 Thomas> and switch all packages that are sourced from Debian to use
 Thomas> http://snapshot.debian.org/ to avoid disappearing packages.

Agreed. Axel, care to send a patch doing that?

-- 
Bye, Peter Korsgaard
