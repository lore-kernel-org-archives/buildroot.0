From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 23:47:16 +0100
Subject: [Buildroot] [PATCH v2] package/ti-cgt-pru: bump to 2.2.1
In-Reply-To: <8f95e1aa-b379-1873-8889-f3c728695e48@gmail.com> (Romain Naour's
 message of "Mon, 15 Jan 2018 22:38:10 +0100")
References: <20180109201306.13526-1-romain.naour@gmail.com>
 <87bmhuuass.fsf@dell.be.48ers.dk>
 <8f95e1aa-b379-1873-8889-f3c728695e48@gmail.com>
Message-ID: <876082spsb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

Hi,

 >> > Fixes:
 >> > http://autobuild.buildroot.net/results/68f/68f60ad38d9b6eae83b5d233966616a25d8c9391
 >> 
 >> 2017.02.x is using 2.1.3. Can you confirm that this version is also
 >> affected by the issue?
 >> 

 > I confirm and it's the same for 2017.11.x. As soon as a recent Linux distro is
 > used with the ti-cgt-pru installer it hang.

Ok, I'll cherrypick this changes for 2017.02.x and 2017.11.x then,
thanks!

-- 
Bye, Peter Korsgaard
