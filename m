From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Apr 2009 07:22:40 +0200
Subject: [Buildroot] using linux 2.4 headers AND python
In-Reply-To: <20090402002811.GA29488@cloud.net.au> (Hamish Moffatt's message
	of "Thu\, 2 Apr 2009 11\:28\:11 +1100")
References: <49C9614C.6010205@caktusgroup.com>
	<877i2ejzrj.fsf@macbook.be.48ers.dk>
	<49C9ABB0.8080501@caktusgroup.com> <49CA4F52.705@caktusgroup.com>
	<20090325232609.GA30311@cloud.net.au>
	<87bproixeh.fsf@macbook.be.48ers.dk>
	<20090402002811.GA29488@cloud.net.au>
Message-ID: <87ljqj634v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

 >> Will you fix it or should I?

 Hamish> I will.

 Hamish> The Python package needs a bit of work anyway. I am using 2.5
 Hamish> in my tree (2.4 is in the repo). There should be a proper
 Hamish> build for the host now that we have $(HOST_DIR) too.

Exactly. I had it on my todo list, but feel free to do it if you have
time for it, I don't normally use Python.

-- 
Bye, Peter Korsgaard
