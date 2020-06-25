From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Jun 2020 13:14:24 +0200
Subject: [Buildroot] [RFC v9 07/10] support/scripts/cpedb.py: new CPE
 XML helper
In-Reply-To: <20200616170341.45098-7-matthew.weber@rockwellcollins.com>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
 <20200616170341.45098-7-matthew.weber@rockwellcollins.com>
Message-ID: <20200625131424.62fb9ea9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Jun 2020 12:03:38 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Python class which consumes a NIST CPE XML and provides helper
> functions to access and search the db's data.
> 
>  - Defines the CPE as a object with operations / formats
>  - Processing of CPE dictionary
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

The pkg-stats script now has some logic to use the NVD database in JSON
format. I guess it doesn't make much sense to duplicate this logic and
use the XML variant of the same database. I believe Gr?gory has already
worked on moving this pkg-stats NVD/CVE logic into a separate library
so that it can be used elsewhere.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
