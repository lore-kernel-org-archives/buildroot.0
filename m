From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Jan 2012 16:09:30 +0100
Subject: [Buildroot] Buildroot Developer Day, Friday 3rd February,
	Brussels
In-Reply-To: <CAAXf6LVqKt=um9x6C_8Py7j5oK7A1v6kZ8KqUVY+qWaU-951Cg@mail.gmail.com>
 (Thomas De Schampheleire's message of "Mon, 30 Jan 2012 15:16:10
 +0100")
References: <20120124000812.6d043023@skate>
 <CAAXf6LW6aCs-G_FD=pXNGsBrV3133donzNxsuNV_7O=9JMCs4Q@mail.gmail.com>
 <201201271133.20517.arnout@mind.be>
 <CAAXf6LU_=sZ4fw_mJ=FL1JZjpc5+Fqf=K=wWQCbHtGLkyZVaBA@mail.gmail.com>
 <87ipjth6hc.fsf@macbook.be.48ers.dk>
 <CAAXf6LVqKt=um9x6C_8Py7j5oK7A1v6kZ8KqUVY+qWaU-951Cg@mail.gmail.com>
Message-ID: <874nvdgrbp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 >> I've maintained buildroot support for a number of projects at $WORK for
 >> 5+ years, and the way I've always handled this is with
 >> branches/tags. Buildroot head moves forward and follows upstream, but
 >> projects might decide to freeze (or if needed branch) once they have a
 >> stable setup. I use the same approach with the Linux kernel and u-boot,
 >> without any real problems.

 Thomas> Essentially this is the same as creating two independent buildroot
 Thomas> repositories, one for each project. This approach does not have a
 Thomas> single mainstream that allows different configurations for each
 Thomas> project, but rather creates two streams, each with their own
 Thomas> configuration. In my case, since we have many similar but different
 Thomas> products, I'd prefer to be able to keep one stream.

Here as well. That stream is the head branch. Branching only happens
once a project no longer wants to follow the main development. This
doesn't mean that the project gets removed from the head version, just
that it is no longer used to cut releases from.

 >> I would prefer to not add too much complexity for such a specialized /
 >> advanced feature.

 Thomas> In its basic form, I don't think it has to be very complex. Although I
 Thomas> haven't looked into this in detail, it could be enough to allow to
 Thomas> override FOO_VERSION from the configuration or from a certain
 Thomas> project-specific file.

What about other version dependencies? Patches, different dependencies,
configure options, ..?

 >> yes, I think this is good to go, it just needs to be implemented. With
 >> us being this close to 2012.02-rc1 I might wait until I start the next
 >> branch though.

 Thomas> I understand. I haven't had a lot of time lately either to submit patches.

No problem. I'll do it myself if you don't get around to do it.

-- 
Bye, Peter Korsgaard
