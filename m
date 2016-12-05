From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Dec 2016 23:34:41 +0100
Subject: [Buildroot] [PATCH] kexec: fix build when BR2_STRIP_none=y
In-Reply-To: <20161202223427.7b411a05@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 2 Dec 2016 22:34:27 +0100")
References: <1480679517-551-1-git-send-email-marcin.nowakowski@imgtec.com>
 <87a8ce8g6c.fsf@dell.be.48ers.dk>
 <20161202213857.673e4b97@free-electrons.com>
 <877f7i6nry.fsf@dell.be.48ers.dk>
 <20161202223427.7b411a05@free-electrons.com>
Message-ID: <87inqy57jy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Fri, 02 Dec 2016 22:09:53 +0100, Peter Korsgaard wrote:

 >> Hi,
 >> 
 >> > My other thought is that I believe it's not the first time (see commit
 >> > fc174b7057495ebb31393ae27f3ceeefdc490022), so perhaps our idea of
 >> > having STRIP=true when BR2_STRIP_none=y is a bad idea, and we should
 >> > handle this in a different way.  
 >> 
 >> The question is how? Create a dummy shell script to better emulate the
 >> command line options / behaviour of strip?

 > I'm not sure. Yet another wrapper kind of sucks. Is it possible to pass
 > enough options to strip to have it not strip anything? :-)

Not that I'm aware of at least. Anyone?

-- 
Bye, Peter Korsgaard
