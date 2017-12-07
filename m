From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 7 Dec 2017 11:33:23 -0800
Subject: [Buildroot] or1k system calls appear broken
In-Reply-To: <20171207192839.GG27558@waldemar-brodkorb.de>
References: <CACPK8Xfjvb565q5xtsN+i3VmAqnx0EH6mxBcg5CRXpsC1_urRw@mail.gmail.com>
 <20171128064921.GA27558@waldemar-brodkorb.de>
 <20171206004159.GA2890@lianli.shorne-pla.net>
 <CACPK8XcCua5m5HgaTP97=ccg8RTgFuRcwGAepRx6+_ocWc5mRw@mail.gmail.com>
 <20171206125530.GB2890@lianli.shorne-pla.net>
 <20171206182000.GE27558@waldemar-brodkorb.de>
 <20171206224419.GC2890@lianli.shorne-pla.net>
 <20171207192839.GG27558@waldemar-brodkorb.de>
Message-ID: <CAMo8BfLbTDTU+tZ2Qtp05borqYzwhpKgmLhMPgm_pqz-7T3ayQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 7, 2017 at 11:28 AM, Waldemar Brodkorb <wbx@openadk.org> wrote:
> I checked the test suite and no syscall() is used.
> Would it be possible for you to suggest a test case for syscall()?
>
> Then I can run the tests for all architectures, where I can do
> runtime testing.

LTP ( http://linux-test-project.github.io )?

-- 
Thanks.
-- Max
