From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 May 2017 11:24:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-enum34: change setup
	type to setuptools
In-Reply-To: <CAGm1_ks5=EtZ27+=OiOE3o6Qkb7ikeSJjLGicLpYSewOU7XnSA@mail.gmail.com>
 (Yegor Yefremov's message of "Mon, 22 May 2017 10:25:12 +0200")
References: <20170521114625.7884-1-bernd.kuhls@t-online.de>
 <87o9ul28ml.fsf@dell.be.48ers.dk>
 <CAGm1_ks5=EtZ27+=OiOE3o6Qkb7ikeSJjLGicLpYSewOU7XnSA@mail.gmail.com>
Message-ID: <87bmql1byj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

Hi,

 >> I'm not sure what the correct fix is. Yegor? Either we patch out the
 >> 'import setuptools' line or we add host-python-setuptools to the
 >> dependencies.

 > I would take Bernd's fix as it is. Defining setuptype as setuptools
 > adds host-python-setuptools and  distutils.core is available anyway.
 > This doesn't seem to hurt. I've written an e-mail to the enum34
 > maintainer with a request to clarify this setup situation.

Ahh, ok - I missed the fact that distutils.core is part of python
itself.

Thanks for contacting the maintainer.

Committed, thanks.

-- 
Bye, Peter Korsgaard
