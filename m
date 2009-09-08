From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 08 Sep 2009 22:15:48 +0200
Subject: [Buildroot] [RFC] [PATCH 0/5] Buildroot cleanup
In-Reply-To: <4AA75F310200007000017827@gwia.alliedtelesyn.co.nz>
References: <4AA62DD20200000D00128C56@gwia.alliedtelesyn.co.nz>
	<4AA75F310200007000017827@gwia.alliedtelesyn.co.nz>
	<4AA75F310200007000017827@gwia.alliedtelesyn.co.nz>
Message-ID: <1252440948.19600.4.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2009-09-09 at 07:54 +1200, angus salkeld wrote:

> Another suggestion would be to completely separate out the toolchain
> into a new package "buildcross.git" that only builds the cross
> toolchain and then buildroot always uses the external toolchain.
> It would make buildroot's toolchain setup simpler (one toolchain mode).
> And make sharing toolchains more obvious.

I like that idea. Can't really judge if it would be a success, but it
seems like a nice solution that has the potential to simplify things.


Sven
