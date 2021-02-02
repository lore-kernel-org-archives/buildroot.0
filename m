From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2021 21:49:33 +0100
Subject: [Buildroot] [PATCH v2 4/7] support/scripts/pkg-stats: check CPE
 existence in CPE dictionnary
In-Reply-To: <20210131133819.1818537-5-thomas.petazzoni@bootlin.com>
References: <20210131133819.1818537-1-thomas.petazzoni@bootlin.com>
 <20210131133819.1818537-5-thomas.petazzoni@bootlin.com>
Message-ID: <375edae0-5aa4-ef8f-ae42-ab8dc4ffb76b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/01/2021 14:38, Thomas Petazzoni wrote:
> This commit extends pkg-stats to leverage the recently introduced
> CPEDB class to verify that the CPEs provided by Buildroot packages are
> indeed known in the official CPE dictionnary provided by NVD.
> 
> Co-Developed-by: Gr?gory Clement <gregory.clement@bootlin.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 This one was accidentally applied to master without Gre?gory's SoB as well.

 I didn't have any further comments on the patch. Imagine that!

 Regards,
 Arnout
