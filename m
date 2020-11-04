From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Nov 2020 12:19:16 +0100
Subject: [Buildroot] [PATCH] package/python-remi: bump version to
 2020.10.30
In-Reply-To: <20201104110531.7b3ae222@x230_1.trabucayre.com> (Gwenhael
 Goavec-Merou's message of "Wed, 4 Nov 2020 11:05:31 +0100")
References: <20201102140000.1753870-1-gwenj@trabucayre.com>
 <87361p4kgd.fsf@dell.be.48ers.dk>
 <20201104110531.7b3ae222@x230_1.trabucayre.com>
Message-ID: <87tuu52wuj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gwenhael" == Gwenhael Goavec-Merou <gwenj@trabucayre.com> writes:

Hello,

 >> For example, if you're using pip, instead of
 >> https://github.com/user/proj/archive/master.zip use
 >> git+https://github.com/user/proj.git#egg=proj make: ***
 >> [package/pkg-generic.mk:250:
 >> /tmp/instance-0/output-1/build/python-remi-2020.10.30/.stamp_built] Error 1
 >> 
 >> http://autobuild.buildroot.net/results/3a6/3a62359d0e183d45e50e999fc2c58f7805bda142/build-end.log
 >> 
 > Weird: I'm unable to reproduce this failure... (in-tree and out-tree build). 

Notice that both failures are with python 2.7, so possibly it is related
to that?


 >> Any specific reason to not get the package from pypi?
 >> 
 > No. I will try it if it's fix this error. But this requires to downgrade
 > python-remi to 2020.8.6

Ok. Mayve contact upstream and ask why pypi isn't updated?

-- 
Bye, Peter Korsgaard
