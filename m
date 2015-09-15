From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 23:13:07 +0200
Subject: [Buildroot] [PATCH] Enable mplayer to be built in arm64
 architectures
In-Reply-To: <6130a3068f57c9a23499f06ba5ab168c1fd4b38b.1442322610.git.jpinto@synopsys.com>
References: <6130a3068f57c9a23499f06ba5ab168c1fd4b38b.1442322610.git.jpinto@synopsys.com>
Message-ID: <20150915231307.6b9cef7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Same thing as the other patch: use your full name as the author and
Signed-off-by. So you should change your $HOME/.gitconfig to something
like:

[user]
        name = Joao Pinto
        email = Joao.Pinto at synopsys.com

Also, the commit title should be:

	mplayer: enable for building on aarch64

The main idea is that all patches should have their title prefixed by
the package they are touching.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
