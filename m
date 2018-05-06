From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 21:22:06 +0200
Subject: [Buildroot] defconfig build issues
In-Reply-To: <5917efea-77e3-e66d-7d2b-b0225f041d4f@mind.be> (Arnout
 Vandecappelle's message of "Sun, 6 May 2018 17:27:04 +0200")
References: <20180505215257.6745fc2f@windsurf>
 <87zi1dthpv.fsf@dell.be.48ers.dk>
 <CAFGQKxetkjrWB8JK5Xi_xxoKY7oKqZoVmKv3K5p-E8DqxLMTsQ@mail.gmail.com>
 <5917efea-77e3-e66d-7d2b-b0225f041d4f@mind.be>
Message-ID: <87muxcpp29.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 06-05-18 15:50, Martin Bark wrote:
 >> Hi,
 >> 
 >> On 6 May 2018 at 07:34, Peter Korsgaard <peter@korsgaard.com> wrote:
 >>>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
 > [snip]
 >>> > raspberrypi3_qt5we_defconfig
 >>> > ============================
 >>> 
 >>> > Your Buildroot configuration needs a compiler capable of building 32 bits binaries.
 >>> > If you're running a Debian/Ubuntu distribution, install the g++-multilib package.
 >>> > For other distributions, refer to their documentation.
 >>> 
 >>> > https://gitlab.com/buildroot.org/buildroot/-/jobs/66561791
 >> 
 >> support/docker/Dockerfile already installs g++-multilib but the image
 >> buildroot/base:20180205.0730 lacks it.  It looks like g++-multilib was
 >> added just after the image was created in commit
 >> 27d22296927d7e4ec0965f2bdaa272b1e8ea15e7
 >> 
 >> So i think this should already be fixed, you just need to update the
 >> buildroot/base image

 >  Or rather, 12b08c2be639e26ba0983d7dbdb3bddd91355f4c should be backported to
 > 2018.02.

Ahh - Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
