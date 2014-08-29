From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Aug 2014 09:56:01 +0200
Subject: [Buildroot] [PATCH 3/3] ruby: bump to version 2.1.2
In-Reply-To: <20140829091725.1fd32d4d@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 29 Aug 2014 09:17:25 +0200")
References: <1409264259-13058-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1409264259-13058-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <877g1rsr62.fsf@dell.be.48ers.dk>
 <20140829091725.1fd32d4d@free-electrons.com>
Message-ID: <87ppfjrapa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> I don't really know much about Ruby. Is 2.1.x compatible with 1.9.x or
 >> is it like Python2/Python3?

 > I don't really know much about Ruby either. But, about Ruby 2.0,
 > Wikipedia says:

 > ""
 > Ruby 2.0 is intended to be fully backward compatible with Ruby 1.9.3.
 > As of the official 2.0.0 release on February 24, 2013, there were only
 > five known (minor) incompatibilities.
 > ""

 > And then, about Ruby 2.1, they say:

 > ""
 > Ruby 2.1.0 was released on Christmas Day in 2013.[31] The release
 > includes speed-ups, bugfixes, and library updates. Starting with 2.1.0,
 > Ruby is using semantic versioning.
 > ""

 > So I believe we can simply bump the ruby package to 2.1, and not bother
 > keeping two separate packages.

Ok, thanks - Committed to next.

-- 
Bye, Peter Korsgaard
