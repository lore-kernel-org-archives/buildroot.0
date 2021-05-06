From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 May 2021 08:53:21 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/openjdk: Change URL to Github
In-Reply-To: <20210505203837.GV2137340@scaer>
References: <20210504210026.1916260-1-aduskett@gmail.com>
 <20210504210026.1916260-2-aduskett@gmail.com>
 <20210505203837.GV2137340@scaer>
Message-ID: <cfde71bd-a3e5-3d3a-d150-8c8cd3e7cc7c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/05/2021 22:38, Yann E. MORIN wrote:
> So, this is not good, because that means the archives we have on s.b.o
> would not longer match what we want to download, so s.b.o can't be used
> as a fallback for master anymore.

 There's a trivial workaround: drop OPENJDK_SOURCE = .... That way, the tarball
name becomes openjdk-... instead of jdk-... and it's a different file.

 Regards,
 Arnout
