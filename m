From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Jun 2017 12:05:46 +0200
Subject: [Buildroot] [PATCH 1/2] xr819-xradio: new package
In-Reply-To: <20170622115009.64bb438b@windsurf> (Thomas Petazzoni's message of
 "Thu, 22 Jun 2017 11:50:09 +0200")
References: <20170618184200.31167-1-geomatsi@gmail.com>
 <20170618184200.31167-2-geomatsi@gmail.com>
 <20170621224139.720d19cc@windsurf>
 <20170622075519.qp2nbrgekpbhc72i@bars>
 <20170622101041.3d01e783@windsurf> <87y3skicbu.fsf@dell.be.48ers.dk>
 <20170622115009.64bb438b@windsurf>
Message-ID: <87lgokibgl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> The only problem is that these file names are not versioned, so it is
 >> difficult to ever change them in the future.

 > If the files are changed, we will change the hashes. Our download infra
 > will notice that the files in the dl folder have a hash that doesn't
 > match the one in the .hash file, and we re-download them.

 > So it seems to work alright, no?

Yes, except for sources.b.o, there we have to keep either the old or the
new variants.

But ok, the github repo will probably stick around.

-- 
Bye, Peter Korsgaard
