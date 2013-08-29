From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Aug 2013 12:14:01 +0200
Subject: [Buildroot] debugging inittab
In-Reply-To: <20130829103126.7bcbf18a@skate> (Thomas Petazzoni's message of
 "Thu, 29 Aug 2013 10:31:26 +0200")
References: <2DD0B9C711CDFC45A3A266C78966CE7F451F39A0@G4W3291.americas.hpqcorp.net>
 <5216A076.5030409@mind.be>
 <2DD0B9C711CDFC45A3A266C78966CE7F451F8F81@G4W3291.americas.hpqcorp.net>
 <521ED985.9050705@mind.be> <20130829103126.7bcbf18a@skate>
Message-ID: <87zjs0g5xy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> What was the reason we didn't do that in the first place?

 Thomas> I personally find it a bit ugly. Moreover, having a file allows
 Thomas> to add contents to explain *why* it is not the root filesystem,
 Thomas> while a directory cannot contain an explanation :)

 Thomas> Since we've added the THIS_IS_NOT_YOUR_ROOT_FILESYSTEM file,
 Thomas> this is the *first* time we have a new report of people using
 Thomas> output/target directly for NFS mounting. At this point, with a
 Thomas> file with such a name, and the contents of the file explaining
 Thomas> how to do NFS mounting, I think there's not much else we can do
 Thomas> except pointing users at this file which documents why what
 Thomas> they are doing cannot work.

True. Let's keep it like it is.

-- 
Bye, Peter Korsgaard
