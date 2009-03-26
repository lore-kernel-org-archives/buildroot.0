From: Tobias McNulty <tobias@caktusgroup.com>
Date: Wed, 25 Mar 2009 20:27:19 -0400
Subject: [Buildroot] using linux 2.4 headers AND python
In-Reply-To: <20090325232609.GA30311@cloud.net.au>
References: <49C9614C.6010205@caktusgroup.com>	<877i2ejzrj.fsf@macbook.be.48ers.dk>	<49C9ABB0.8080501@caktusgroup.com>
	<49CA4F52.705@caktusgroup.com>
	<20090325232609.GA30311@cloud.net.au>
Message-ID: <49CACBE7.80504@caktusgroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hamish Moffatt wrote:
>> Is that line really supposed to be there?
> 
> No it isn't, but you should also have the .pyc file (unless you have set
> BR2_PACKAGE_PYTHON_PY_ONLY) so 'import os' will still work. You might
> want to build python with logging and post the log here, ie
> 
> make python-dirclean python 2>&1 > pybuild.log
> 
> 'svn blame' suggests this is my mistake. I use ..._PYC_ONLY so I didn't
> notice.

Cool, thanks for the quick reply.  I do have BR2_PACKAGE_PYTHON_PY_ONLY
selected, but only because that's the default.  Is PYC generally
smaller/faster?  A quick google seems to suggest that it's not much
faster..but maybe the difference is more noticeable on smaller embedded
machines.

Toby

-- 
Tobias McNulty
Caktus Consulting Group, LLC
P.O. Box 1454
Carrboro, NC 27510
(919) 951-0052
http://www.caktusgroup.com
