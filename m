From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 28 Mar 2007 23:13:40 +0200
Subject: [Buildroot] how i can crosscompiling mysql with buildroot
In-Reply-To: <20070328153601.49940@gmx.net>
References: <20070328153601.49940@gmx.net>
Message-ID: <20070328211340.GF24135@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 28, 2007 at 05:36:01PM +0200, Stephan Raue wrote:
>Hi,
>
>i need a "working" mysql.mk (version 5.0.xx or version 4.xx) for buildroot to build MySQL Server and Client, does anyone know where i can get this? Or where i can get patches and instructions to crosscompiling mysql with uclibc (buildroot)?

http://buildroot.uclibc.org/buildroot.html#add_software

I didn't build mysql in a long time myself, so i can't say if you'll
have to patch it to behave.. If you need to patch it, perhaps ask the
mysql folks for help so it still does what it's supposed to do,
afterwards.

HTH,
