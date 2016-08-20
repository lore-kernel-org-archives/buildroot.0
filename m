From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sat, 20 Aug 2016 13:03:09 -0400
Subject: [Buildroot] pointer dereference to incomplete type
	vm_operations_struct
Message-ID: <CAK7rcp9RQO8gfsqc6SAyFpn=kK19iRrS=ckYvnSWJuutc_SE3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm trying to compile a small linux, and I'm getting an error
sometimes with vm_operations_struct as per the email title. Is there
some kernel option that I'm missing or forgetting to enable? I did a
make clean and was sure to delete my build and target directories. But
I still get that error. Is there some option that I'm missing that
must be set?
