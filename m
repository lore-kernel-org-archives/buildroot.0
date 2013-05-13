From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 May 2013 00:51:31 +0200
Subject: [Buildroot] A new version of http://autobuild.buildroot.org
In-Reply-To: <20130513232154.477c6c7b@skate>
References: <20130513232154.477c6c7b@skate>
Message-ID: <51916E73.4000403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/05/13 23:21, Thomas Petazzoni wrote:
>   * The full build log is no longer available. Storing those entire
>     build logs was consuming a huge amount of disk space. I assume that
>     the last 100 lines of the build log are sufficient to have a rough
>     idea of what's going. Otherwise, the build can easily be reproduced.

  Still, there have been (very few) situations where the error message 
itself was not in the last 100 lines. I think 500 lines is safer.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
