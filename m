From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Jul 2019 23:24:13 +0200
Subject: [Buildroot] [PATCH v4 15/15] package/gcc: enable gcc 9.1 for
 ork1 (openrisc)
In-Reply-To: <20190620100725.105587-16-giulio.benetti@micronovasrl.com>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-16-giulio.benetti@micronovasrl.com>
Message-ID: <54fe6b56-aa43-b657-0b8e-1c42e2471735@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/06/2019 12:07, Giulio Benetti wrote:
> openrisc support has been added with gcc 9.1.
> Keep for now the old gcc 5 fork for ork1.

 So, when will we remove this?

 Same for ARC (GCC 8.x fork) and C-SKY (GCC 6.x fork): they are available in
GCC9, do we need to keep those old forks?

 Regards,
 Arnout
