From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Wed, 19 Apr 2017 15:01:01 +0200
Subject: [Buildroot]
	=?iso-8859-1?q?=5BPATCH=5D_Restore_=2Egit_directory_i?=
	=?iso-8859-1?q?n_git_package_downloads?=
In-Reply-To: <20170419041553.w2hxo7dqnzuaccan@sapphire.tkos.co.il>
References: <1492574439-4617-1-git-send-email-james@balean.com.au>
 <20170419041553.w2hxo7dqnzuaccan@sapphire.tkos.co.il>
Message-ID: <50405f08-370b-4d72-9130-d16479d61f9a@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On st?eda 19. dubna 2017 6:15:53 CEST, Baruch Siach wrote:
> Is there anything missing for your use case?

This is largely hypothetical (I don't know if any of these are packaged for 
Buldroot), but I know several projects which try to look at the output of 
`git describe` to create a pretty version string at build time (such as 
"v0.7-220-g270d875").

With kind regards,
Jan
