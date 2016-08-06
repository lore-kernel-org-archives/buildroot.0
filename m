From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Aug 2016 12:22:18 +0200
Subject: [Buildroot] Buildroot 2016.08-rc1 released
In-Reply-To: <20160806120842.1574e227@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 6 Aug 2016 12:08:42 +0200")
References: <87lh0a9qcr.fsf@dell.be.48ers.dk>
 <20160806120842.1574e227@free-electrons.com>
Message-ID: <87h9ay9oyt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 06 Aug 2016 11:52:20 +0200, Peter Korsgaard wrote:

 >> Buildroot 2016.08-rc1 is released - Go download it at:

 > Thanks for doing this release!

 >> - Hash files for integritry validation have been added for all
 >> packages.

 > Are you sure? According to http://autobuild.buildroot.net/stats/, there
 > are still 90 packages without hashes. Moreover, the hashes are
 > currently not checked for packages not sourced from http/ftp.

A quick check of package/ seemed to show that the only ones missing were
people with custom _SITE_METHOD, but I didn't check the other dirs.

So for the packages where we currently can check hashes, we are now
doing it. I might clarify the description for the final release mail.

 > Another very important thing which I believe should be mentioned in the
 > final release e-mail is the fact that the dependencies of host packages
 > are no longer derived from the dependencies of the corresponding target
 > package. This might very well cause issues for users having their own
 > packages.

True, I will add that.

 > Last but not least, could you announce the Buildroot Developers meeting
 > in the final release e-mail?

Sure, I normally only add that to the final release mail.

 > Thanks a lot!

You're welcome, and thanks for handling a bunch of patches while I was
slacking on holidays :P

-- 
Venlig hilsen,
Peter Korsgaard 
