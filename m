From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 15 Oct 2009 12:51:48 +0200
Subject: [Buildroot] Missing 'make install' option ?
In-Reply-To: <4AD6F907.6070106@mimc.co.uk>
References: <4AD6ED89.6020902@mimc.co.uk> <1255601357.3933.4.camel@sven>
	<4AD6F907.6070106@mimc.co.uk>
Message-ID: <1255603908.3933.5.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2009-10-15 at 11:27 +0100, Mark Jackson wrote:

> A sort of 'make install' which would:-
> 
> (a) delete the output/target contents
> (b) copy target_skeleton to output/target
> (c) run 'make install' on all selected packages (re-compiling if required)

I would certainly not expect 'make install' to delete anything.


Sven
