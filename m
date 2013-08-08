From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Aug 2013 20:46:31 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-08-07
In-Reply-To: <CAAXf6LVewPXENrKj_-ib2iNAFFk-4+sV=EPKxzZbMCP79TXKjg@mail.gmail.com>
References: <20130808063004.7C3E852C1BE@lolut.humanoidz.org>
 <CAAXf6LVewPXENrKj_-ib2iNAFFk-4+sV=EPKxzZbMCP79TXKjg@mail.gmail.com>
Message-ID: <20130808204631.1a482566@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 8 Aug 2013 13:55:17 +0200, Thomas De Schampheleire wrote:
> On Thu, Aug 8, 2013 at 8:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> >      i686 |           host-libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/4ef2adf5ba85a84ba6ff2ae77d2913ba09897b8d/
> 
> "No space left on device"
> 
> Does this happen regularly? Is space that tight?

No, it doesn't happen that often. There is plenty of space on this
machine. The particular machine on which this build took place (gcc110)
has plenty of disk space:

/dev/md1         539G   14G  497G   3% /
/dev/md0         788M  156M  592M  21% /boot
/dev/md3         2,0G  207M  1,7G  12% /tmp
/dev/md4         1,6T  1,1T  466G  70% /home

But I believe that at the time of the build failure, something was
consuming a lot of disk space. These machines are shared, and it relies
on the good behavior of all users to work properly. So sometimes, a
mail is sent on the users mailing list to ask people to do some clean
up.

So I think we can simply discard those results and concentrate on the
real ones :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
