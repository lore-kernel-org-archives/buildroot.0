From: Jo <contact@samplerbox.org>
Date: Thu, 28 May 2015 16:36:12 +0200
Subject: [Buildroot] Are these packages already present or easy to add?
Message-ID: <CA+BV=GWq-a_Jvma7X9DBpbYUPyPhRkU=L3+BJ9yffWQV3iT8dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

For my open-source project www.samplerbox.org, I think that using
Buildroot would be great (fast boot time, etc.).

The requirements for https://github.com/josephernest/SamplerBox  are:

* python-dev  (probably already there?)
* cython   (not needed on target, only on host)
* python-smbus    (present?)
* portaudio19-dev    (present?)
* https://github.com/superquadratic/rtmidi-python.git       (to be done...)
* http://people.csail.mit.edu/hubert/git/pyaudio.git           (to be done...)

I imagine you are already busy on lots of projects, but if some of you
have skills to build  the missing packages or contribute to making a
Buildroot for SamplerBox, it would help me a lot.

I will happily donate for help :)

Best

Jo
