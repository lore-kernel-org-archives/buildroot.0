From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 29 Jan 2015 18:42:08 -0600
Subject: [Buildroot] Package python-pyxml missing?
In-Reply-To: <54CAC560.5060407@ecoventsystems.com>
References: <54CAC560.5060407@ecoventsystems.com>
Message-ID: <CAMQcK5K3Ye22haHyNcpOtdv1z4EqmKptC_84re527fhSW+xjnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Shawn,

On Thu, Jan 29, 2015 at 5:42 PM, Shawn Rose <sr@ecoventsystems.com> wrote:
> Hi,
>
> Is the python-pyxml package suppose to be included in the latest builds?
>  I just did a git clone git://git.busybox.net/buildroot and the package
> buildroot/package/python-pyxml is missing.  I also do not see it on
> http://git.buildroot.net/buildroot/ on the master branch.

That package has been submitted for inclusion into buildroot with the
following patch:

http://patchwork.ozlabs.org/patch/427112/

> Why I ask is my python-setuptools crashes on for me when I use any of
> its functionality with the error ImportError: No module named
> xml.dom.pulldom   I believe this is due to my python xml package being
> missing.

Please apply this patch to your clone of buildroot following these
instructions (section 21.3.1):

http://nightly.buildroot.org/manual.html#_reviewing_and_testing_patches

If this patch works for you, please add a "Tested by:" to the patch
following instructions in the section linked above.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
