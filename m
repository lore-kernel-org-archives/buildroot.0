From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 13:28:08 +0100
Subject: [Buildroot] [PATCH] package/libxml2: properly set
 LIBXML2_IGNORE_CVES
In-Reply-To: <CAAXf6LX65aoXZG+4+M71g-XZqha53aFrg6KFcOta=pBy2DkUJQ@mail.gmail.com>
References: <20200218233647.128671-1-thomas.petazzoni@bootlin.com>
 <CAAXf6LX65aoXZG+4+M71g-XZqha53aFrg6KFcOta=pBy2DkUJQ@mail.gmail.com>
Message-ID: <20200219132808.5c8a7151@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Feb 2020 10:11:51 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> What is the update frequency of http://autobuild.buildroot.org/stats/ ?

Normally every day at 8:00 AM CET. Based on the data of the next branch
when a next branch exists, otherwise using data of the master branch.

However, we will probably want to run it on master / LTS as well in
order to have CVE information for these branches as well.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
