From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 17:15:53 +0200
Subject: [Buildroot] [PATCH] openpgm: bump to version release-5-2-122
In-Reply-To: <56279A94.8010809@imgtec.com>
References: <1445435791-40706-1-git-send-email-Vincent.Riera@imgtec.com>
 <56279A94.8010809@imgtec.com>
Message-ID: <20151021171553.52fcee58@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 21 Oct 2015 15:00:52 +0100, Vicente Olivert Riera wrote:
> On 10/21/2015 02:56 PM, Vicente Olivert Riera wrote:
> [snip]
> > - Run the bootstrap.sh script it fails to autoreconf properly
> - Run the bootstrap.sh script; it fails to autoreconf properly

I quickly looked at the bootstrap.sh script, and besides the messages in
Japanese (or what I guessed to be Japanese), nothing really unusual
stands out. What fails if you just have AUTORECONF = YES ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
