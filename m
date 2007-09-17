From: Blue Swirl <blauwirbel@gmail.com>
Date: Mon, 17 Sep 2007 20:21:31 +0300
Subject: [Buildroot] sparc64 v9 VIS toolchain bug with fzeros?
In-Reply-To: <20070916212533.GO20058@aon.at>
References: <20070915075059.68EC4A6056@busybox.net>
	<20070915121916.GK20058@aon.at>
	<f43fc5580709150607t4e51b73by878a54e35da00750@mail.gmail.com>
	<20070915192154.GL20058@aon.at>
	<f43fc5580709151241g578c4ce8i85d956039a747958@mail.gmail.com>
	<20070915222726.GN20058@aon.at> <20070916212533.GO20058@aon.at>
Message-ID: <f43fc5580709171021s3efbb445ma65672c454ab823b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9/17/07, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
> Configuring gcc with --with-tune=v9 and -mvis in cflags, how can there
> be a call to fzeros (a v9a instruction, from the looks)?

You specified -mvis. The instruction set is like this:
v9 = no vis
v9a = v9 + vis 1
v9b = v9a + vis 2
