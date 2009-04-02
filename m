From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 2 Apr 2009 11:28:11 +1100
Subject: [Buildroot] using linux 2.4 headers AND python
In-Reply-To: <87bproixeh.fsf@macbook.be.48ers.dk>
References: <49C9614C.6010205@caktusgroup.com>
	<877i2ejzrj.fsf@macbook.be.48ers.dk>
	<49C9ABB0.8080501@caktusgroup.com> <49CA4F52.705@caktusgroup.com>
	<20090325232609.GA30311@cloud.net.au>
	<87bproixeh.fsf@macbook.be.48ers.dk>
Message-ID: <20090402002811.GA29488@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 26, 2009 at 07:57:42AM +0100, Peter Korsgaard wrote:
> >>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:
> 
> Hi,
> 
>  Hamish> 'svn blame' suggests this is my mistake. I use ..._PYC_ONLY
>  Hamish> so I didn't notice.
> 
> Will you fix it or should I?

I will.

The Python package needs a bit of work anyway. I am using 2.5 in my tree
(2.4 is in the repo). There should be a proper build for the host now
that we have $(HOST_DIR) too.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
