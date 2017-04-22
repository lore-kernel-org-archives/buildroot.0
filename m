From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:03:59 +0200
Subject: [Buildroot] [PATCH v8 09/12] e2fsprogs: disable unneeded
 features for host
In-Reply-To: <20170422115955.22718-10-arnout@mind.be>
References: <20170422115955.22718-1-arnout@mind.be>
 <20170422115955.22718-10-arnout@mind.be>
Message-ID: <20170422150359.01e5a39b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Apr 2017 13:59:52 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Carlos Santos <casantos@datacom.ind.br>
> 
> We don't need e2initrd_helper or the test I/O manager for the host, just
> like we don't need it for the target.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> [Arnout: don't add --disable-rpath, since we *do* need rpath for the
>  target; otherwise we have to explicitly pass LD_LIBRARY_PATH to be

I guess you meant "we *do* need rpath for the host", right ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
