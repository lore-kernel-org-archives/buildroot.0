From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Apr 2015 22:54:41 +0200
Subject: [Buildroot] [PATCH 1/1] libvpx : add hash
In-Reply-To: <20150406223454.0ded81b7@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 6 Apr 2015 22:34:54 +0200")
References: <1428350210-18111-1-git-send-email-sagaert.johan@proximus.be>
 <20150406223454.0ded81b7@free-electrons.com>
Message-ID: <87twwtf04u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> +# Locally computed:
 >> +sha256  b3917c9167fc4979377fddee7f4e9378c35698dad18e23a729251c77644a2048  libvpx-v1.3.0.tar.gz

 > We're fetching via Git, and the tarball is generated locally on your
 > machine. Since this process is not reproducible, we cannot guarantee
 > that the hash will always be the same. Therefore, we do not store hash
 > files for Git-sourced packages.

 > I've marked your patch as Rejected in patchwork for this reason.

Also notice that libvpx 1.4.0 was recently released (including tarball),
so it probably makes sense to bump and then add the .hash:

https://groups.google.com/a/webmproject.org/forum/#!topic/codec-devel/2zYWenmdUM8

-- 
Bye, Peter Korsgaard
