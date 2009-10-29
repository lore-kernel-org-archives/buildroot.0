From: Roman Chertov <rchertov@cs.ucsb.edu>
Date: Thu, 29 Oct 2009 09:10:26 -0700
Subject: [Buildroot] busybox question
In-Reply-To: <87pr87b5el.fsf@macbook.be.48ers.dk>
References: <20091027211438.BEC2B7773A@busybox.osuosl.org>	<4AE7C7C5.8090001@cs.ucsb.edu>
	<877hufddx5.fsf@macbook.be.48ers.dk>	<4AE870AC.6070601@cs.ucsb.edu>
	<4AE87550.9090603@toumaz.com>	<4AE89CFE.5050406@cs.ucsb.edu>
	<87y6mvb6fv.fsf@macbook.be.48ers.dk>	<4AE8AED3.9040004@cs.ucsb.edu>
	<87pr87b5el.fsf@macbook.be.48ers.dk>
Message-ID: <4AE9BE72.4080509@cs.ucsb.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Remember that you need to do a clean rebuild after changing
> soft/hardfloat (rm -rf output; make if you are using git, rm -rf
> *build_*; make if you are using the release).

That worked.  I did a full rebuild and now I can boot up and login.  Thanks.

Roman

> 
