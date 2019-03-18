From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Mar 2019 22:10:47 +0100
Subject: [Buildroot] [PATCH] libiio: bump to version 0.15
In-Reply-To: <20190314212950.70b4100e@windsurf> (Thomas Petazzoni's message of
 "Thu, 14 Mar 2019 21:29:50 +0100")
References: <20190313082932.13596-1-ardeleanalex@gmail.com>
 <20190314212950.70b4100e@windsurf>
Message-ID: <87ef737uso.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > I had a look at
 > https://github.com/analogdevicesinc/libiio/releases/tag/v0.15, and it
 > looks like between 0.14 and 0.15, the number of commits is fairly
 > limited, and the vast majority of them are fixes. So I believe it
 > should be OK to directly take this bump to 0.15 in the LTS release.

 > Peter, do you agree ?

Yes, agreed. I've cherry picked the commit to the 2019.02.x branch.

-- 
Bye, Peter Korsgaard
