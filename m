From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 28 Nov 2017 07:49:21 +0100
Subject: [Buildroot] or1k system calls appear broken
In-Reply-To: <CACPK8Xfjvb565q5xtsN+i3VmAqnx0EH6mxBcg5CRXpsC1_urRw@mail.gmail.com>
References: <CACPK8Xfjvb565q5xtsN+i3VmAqnx0EH6mxBcg5CRXpsC1_urRw@mail.gmail.com>
Message-ID: <20171128064921.GA27558@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joel,
Joel Stanley wrote,

> Hello,
> 
> I did a build of the Buildroot Openrisc Qemu defconfig and attempted
> to run some userspace tools. They were failing in strange ways:

Can you test the buildroot patch I have sent to the mailinglist,
it updates uClibc-ng 1.0.27. This contains a lot of critical
bugfixes for or1k from Stafford.

best regards
 Waldemar
