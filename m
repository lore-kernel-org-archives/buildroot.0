From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 May 2010 17:38:27 +0200
Subject: [Buildroot] [git commit master] package: Add
	$(HOST_DIR)/usr/lib to LD_LIBRARY_PATH for host but not target
In-Reply-To: <20100506173139.6962b92d@surf> (Thomas Petazzoni's message of
	"Thu, 6 May 2010 17:31:39 +0200")
References: <20100503113725.506018D55F@busybox.osuosl.org>
	<20100506173139.6962b92d@surf>
Message-ID: <877hnh9h1o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:


 Thomas> What do you think of such a change ? Would it be acceptable ? Of
 Thomas> course, I would add a comment before that HOST_CFLAGS line explaining
 Thomas> what the intention is.

Yes, it won't win any prices for prettyness, but I think it's the best
we can do.

Thanks.

-- 
Bye, Peter Korsgaard
