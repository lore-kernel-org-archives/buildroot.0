From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 01 Oct 2009 13:28:57 +0200
Subject: [Buildroot] how to clean up everything but the toolchain
In-Reply-To: <87a5b0800910010422s36a75d2frf5d2e62ee397e3af@mail.gmail.com>
References: <1254384273.5284.5.camel@sven>
	<87a5b0800910010422s36a75d2frf5d2e62ee397e3af@mail.gmail.com>
Message-ID: <1254396537.5284.9.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2009-10-01 at 12:22 +0100, Will Newton wrote:

> I have found it sufficient to remove build_arm and project_build_arm.
> Some stuff in the toolchain still gets rebuilt but not as much as a
> full rebuild.

I found that the build will fail if I do that. Might be specific to our
setup though.


Sven
