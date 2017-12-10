From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 10 Dec 2017 11:17:55 +0100
Subject: [Buildroot] or1k system calls appear broken
In-Reply-To: <CAMo8BfLbTDTU+tZ2Qtp05borqYzwhpKgmLhMPgm_pqz-7T3ayQ@mail.gmail.com>
References: <CACPK8Xfjvb565q5xtsN+i3VmAqnx0EH6mxBcg5CRXpsC1_urRw@mail.gmail.com>
 <20171128064921.GA27558@waldemar-brodkorb.de>
 <20171206004159.GA2890@lianli.shorne-pla.net>
 <CACPK8XcCua5m5HgaTP97=ccg8RTgFuRcwGAepRx6+_ocWc5mRw@mail.gmail.com>
 <20171206125530.GB2890@lianli.shorne-pla.net>
 <20171206182000.GE27558@waldemar-brodkorb.de>
 <20171206224419.GC2890@lianli.shorne-pla.net>
 <20171207192839.GG27558@waldemar-brodkorb.de>
 <CAMo8BfLbTDTU+tZ2Qtp05borqYzwhpKgmLhMPgm_pqz-7T3ayQ@mail.gmail.com>
Message-ID: <20171210101755.GH27558@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,
Max Filippov wrote,

> On Thu, Dec 7, 2017 at 11:28 AM, Waldemar Brodkorb <wbx@openadk.org> wrote:
> > I checked the test suite and no syscall() is used.
> > Would it be possible for you to suggest a test case for syscall()?
> >
> > Then I can run the tests for all architectures, where I can do
> > runtime testing.
> 
> LTP ( http://linux-test-project.github.io )?

The problem with LTP is that some of the automatic tests via
qemu in system mode are done in a small environment, which not much
RAM or any hard disk. I somtimes try to make more architectures and
targets to work with LTP, but for this small cleanup I would
prefer a simple test case included in uClibc-ng-test.

Anyone?

best regards
 Waldemar
