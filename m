From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2016 12:08:42 +0200
Subject: [Buildroot] Buildroot 2016.08-rc1 released
In-Reply-To: <87lh0a9qcr.fsf@dell.be.48ers.dk>
References: <87lh0a9qcr.fsf@dell.be.48ers.dk>
Message-ID: <20160806120842.1574e227@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 06 Aug 2016 11:52:20 +0200, Peter Korsgaard wrote:

> Buildroot 2016.08-rc1 is released - Go download it at:

Thanks for doing this release!

>  - Hash files for integritry validation have been added for all
>    packages.

Are you sure? According to http://autobuild.buildroot.net/stats/, there
are still 90 packages without hashes. Moreover, the hashes are
currently not checked for packages not sourced from http/ftp.

Another very important thing which I believe should be mentioned in the
final release e-mail is the fact that the dependencies of host packages
are no longer derived from the dependencies of the corresponding target
package. This might very well cause issues for users having their own
packages.

Last but not least, could you announce the Buildroot Developers meeting
in the final release e-mail?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
