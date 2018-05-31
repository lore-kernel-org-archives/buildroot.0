From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 May 2018 19:31:46 +0200
Subject: [Buildroot] custom skeleton question
In-Reply-To: <676099E7-4BB5-4A00-91A2-B880D4308A08@stask.net> (Liam
 Staskawicz's message of "Wed, 30 May 2018 23:02:57 -0700")
References: <85B790C7-22DB-4715-A360-5D229877EB00@stask.net>
 <874liq5k2q.fsf@dell.be.48ers.dk>
 <7C5724A9-4880-4ED6-A49F-D306AD2ADE5B@stask.net>
 <87y3g13bnp.fsf@dell.be.48ers.dk>
 <676099E7-4BB5-4A00-91A2-B880D4308A08@stask.net>
Message-ID: <87o9gv20l9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Liam" == Liam Staskawicz <liam@stask.net> writes:

Hi,

 >> Ok - But again, if the Ubuntu base image contains a bunch of prebuilt
 >> binaries and library you may very well end up with odd errors if you try
 >> to merge them with Buildroot.
 >> 
 >> What are you trying to achieve here?

 > Your advice makes sense :)

Good ;)

 > I am mainly trying to make an incremental transition from a system
 > based on ubuntu to one based on buildroot. My first step is providing
 > a similar userspace to the current system while transitioning the
 > kernel build and packaging to buildroot. Subsequently, I plan to more
 > completely isolate the userspace such that it can ship with a pure
 > buildroot rootfs.

 > So, while this is not strictly an ideal use of buildroot, it's a helpful stepping stone.

Ok, as long as you are aware of the potential pitfalls.

-- 
Bye, Peter Korsgaard
