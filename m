From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Sep 2017 10:30:25 +1000
Subject: [Buildroot] [PATCH 1/2] configs: qemu_ppc64_pseries: Update to
 kernel 4.13.1
In-Reply-To: <61b878ac-d766-c6d5-88fb-3890415ca974@mind.be>
References: <20170920024845.26157-1-joel@jms.id.au>
 <20170920024845.26157-2-joel@jms.id.au>
 <61b878ac-d766-c6d5-88fb-3890415ca974@mind.be>
Message-ID: <CACPK8XfOyfozXzfLCtxomdeFrcB82O3BfUYdNt93VFSJYg-eUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 27, 2017 at 8:04 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 20-09-17 04:48, Joel Stanley wrote:
>> Drop the custom headers bit as it is not required.
>
>  This is not actually true, you kept the custom headers bit.
>
>  I updated the commit message and applied to master, thanks.

Thank you for fixing that up. I did remove it, but then added it back
without tweaking the commit message.

Cheers,

Joel
