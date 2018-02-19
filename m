From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Feb 2018 22:43:44 +0100
Subject: [Buildroot] [PATCH master 1/1] zic: bump to 2018c
In-Reply-To: <20180219222250.2fde9d31@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 19 Feb 2018 22:22:50 +0100")
References: <20180219132212.19877-1-aduskett@gmail.com>
 <877er8kc4a.fsf@dell.be.48ers.dk>
 <20180219212453.705a4846@windsurf.home>
 <878tboisr6.fsf@dell.be.48ers.dk>
 <20180219222250.2fde9d31@windsurf.home>
Message-ID: <874lmcirjj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Mon, 19 Feb 2018 22:17:33 +0100, Peter Korsgaard wrote:

 >> > Why was this targeted for master, and committed in master ?  
 >> 
 >> I must say I was wondering that as well, but given that this is the
 >> timezone database, I could see the advantage of having uptodate
 >> information for the (LTS) release, and a relatively limited risk of
 >> issues, so I applied it.

 > zic is not the time zone database in fact. tzdata is the timezone
 > database. zic is the host tool used to compile time zone files.

Indeed, seems like I mixed that up.

-- 
Bye, Peter Korsgaard
