From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Oct 2015 10:01:29 +0100
Subject: [Buildroot] Buildroot LTS?
In-Reply-To: <20151030145803.6aeb3c2d@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 30 Oct 2015 14:58:03 +0100")
References: <563336DE.4040809@2net.co.uk>
 <20151030145803.6aeb3c2d@free-electrons.com>
Message-ID: <87eggb1keu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> I would be interested in any comments on the above. What do Buildroot
 >> users do in practice? Does any 3rd party offer LTS support for Buildroot?

 > There is currently no long term support policy for the community
 > maintained Buildroot. We have discussed this topic a few times during
 > our meetings, as I remember raising the question of whether we should
 > maintain for a longer period certain specific releases of Buildroot, at
 > least to take care of the security problems.

 > So far, our common reaction was that it is rather time-consuming to do
 > and also not very exciting for volunteers to do. It is the type of
 > topic that would really be helped if there was some funding from
 > companies.

Indeed, so far nobody has volunteered to do such work.

 > That being said, if there is sufficient interest for this, and
 > developers willing to look at the security issues and submit the
 > corresponding patches, I'm sure we'd be happy to create such LTS
 > releases from time to time.

Certainly. We already do bugfix releases (like 2015.08.1) for important
issues discovered after release. I have no problems doing more of those,
but people have to submit patches and/or point out what patches on
master also applies to the bugfix release.

-- 
Bye, Peter Korsgaard
