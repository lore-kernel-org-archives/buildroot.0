From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Dec 2012 22:07:30 +0100
Subject: [Buildroot] Boost builds failed
In-Reply-To: <673DDE2D-005B-43FD-A21B-B84568013166@gmail.com>
References: <673DDE2D-005B-43FD-A21B-B84568013166@gmail.com>
Message-ID: <50CA4392.1020708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/12/12 11:40, Victor Hiairrassary wrote:
> During some auto builds, boost failed to compiles because on .config file, only boost is selected, and no boost library is selected, like thread regex,etc.

  I don't think the issue is that no library is selected; rather, it looks
like something breaks down in uClibc builds...

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
