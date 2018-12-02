From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Sun, 2 Dec 2018 19:44:08 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-12-01
In-Reply-To: <20181202070028.CF00F20DB0@mail.bootlin.com>
References: <20181202070028.CF00F20DB0@mail.bootlin.com>
Message-ID: <20181202184408.GC13145@x1.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On zo, 02 dec 2018 08:00:28 +0100, Thomas Petazzoni wrote:
> Results for the 'next' branch
> =============================
> 
> Build failures related to your packages:
> 
>      aarch64 |                   bcusdk-0.0.5 | http://autobuild.buildroot.net/results/b6a1c0cce438c3ef6f75959426816c52cc45e3a3

Correct me if I'm wrong, but the error

	/tmp/ccVahWlI.s:135: Error: unknown mnemonic `rorw' -- `rorw $8,w3'

that pops up after a year of silence makes me suspect the toolchain
rather than the package.
I don't follow the toolchain changes that close, could anyone comment?

Kurt
