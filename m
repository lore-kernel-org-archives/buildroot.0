From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Mar 2012 00:20:30 +0100
Subject: [Buildroot] [PATCH 1/1] parted: make sure to select libuuid in
	util-linux
In-Reply-To: <722c7ebc3d803582a621ac1765b63dc51cc55a4a.1332230951.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 20 Mar 2012 09:09:18 +0100")
References: <cover.1332230951.git.thomas.petazzoni@free-electrons.com>
 <cover.1332230951.git.thomas.petazzoni@free-electrons.com>
 <722c7ebc3d803582a621ac1765b63dc51cc55a4a.1332230951.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87sjh2j1vl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> parted correctly depends on util-linux, but fails to select the
 Thomas> libuuid suboption of util-linux, causing the following build failure
 Thomas> if libuuid remains unselected:

Committed, thanks.

-- 
Bye, Peter Korsgaard
