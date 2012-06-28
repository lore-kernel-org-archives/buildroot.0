From: Alex Bradbury <asb@asbradbury.org>
Date: Thu, 28 Jun 2012 13:34:39 +0100
Subject: [Buildroot] Buildroot and top-level parallel make
Message-ID: <CA+wH296drhV6yie5+79Y38qLmo_5cE1=3qaOrw5jbyCJ5mEMog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As I understand it, buildroot will allow parallelism while building
individual packages yet does not support "top-level parallel make".
i.e. it is not possible to build multiple packages in parallel. I
found a reference to this problem at http://lwn.net/Articles/416916/
and it was also listed as a WIP in the "cross build systems: present
and future" slides from 2010.

I was wondering what the outcome of experiments to allow top-level
parallelism were? What are the major barriers to allowing this? Is it
still something seen as feasible to add to buildroot, or is it looking
like it would add too much complexity?

Thanks,

Alex
