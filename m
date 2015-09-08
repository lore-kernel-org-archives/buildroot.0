From: Brendan Heading <brendanheading@gmail.com>
Date: Tue, 8 Sep 2015 15:17:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/host-gdb: fix autobuild failure
In-Reply-To: <55EEED12.6000909@mind.be>
References: <1441721106-27234-1-git-send-email-brendanheading@gmail.com>
 <55EEED12.6000909@mind.be>
Message-ID: <CA+BsyQ7cdCN7uodpnJ0Quea8Qi4cPRxkyGsR4N+FpJW7ADuD1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> host-gdb is broken on all architectures at the moment, as it seems to
>> require makeinfo during "make install" even if configure
>> failed to detect it. Instead of trying to hack it, let's simply make gdb
>> dependent on host-texinfo.
>
>  Any idea why this is not needed for target gdb?

Good point, I expect that it is - I will check and resubmit.

Brendan
