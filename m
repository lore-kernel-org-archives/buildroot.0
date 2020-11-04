From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Nov 2020 20:22:53 +0100
Subject: [Buildroot] [PATCH] package/python-remi: downgrade to 2020.8.6
 and move to pypi
In-Reply-To: <20201104174704.21d49585@windsurf.home> (Thomas Petazzoni's
 message of "Wed, 4 Nov 2020 17:47:04 +0100")
References: <20201104141303.2124172-1-gwenj@trabucayre.com>
 <20201104174704.21d49585@windsurf.home>
Message-ID: <87pn4t2agi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Wed,  4 Nov 2020 15:13:03 +0100
 > Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

 >> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 >> 
 >> Since
 >> https://github.com/dddomodossola/remi/commit/481ee7ca3df55be127db35560978a36997a2c088
 >> 
 >> remi use setuptools-scm to obtain version, but .git directory is dropped when
 >> the archive is fetched. The result is a build failure like:

 > Do we need to do more than reverting
 > d58a2267a61c1377e390aa132850d6098917cf88 ?

That would bring us back to the 2019.9 release - Or what do you mean?

-- 
Bye, Peter Korsgaard
