From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Jan 2012 00:00:21 +0100
Subject: [Buildroot] [PATCH 2/2] New package: kmod
In-Reply-To: <CAGm1_ks1+PmxFWF6CAA7Y4FSaWVKSaOvRZXwQRVXti=ojMcRbA@mail.gmail.com>
References: <1326726276-8442-1-git-send-email-yegorslists@googlemail.com>
 <87ty3upg82.fsf@macbook.be.48ers.dk>
 <CAGm1_ks1+PmxFWF6CAA7Y4FSaWVKSaOvRZXwQRVXti=ojMcRbA@mail.gmail.com>
Message-ID: <201201180000.22317.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 17 January 2012 23:13:08 Yegor Yefremov wrote:
> As we came to this topic, what is your opinion on adding /run? It also
> became udev's dependency.

 IIRC /run basically replaces /var/run in Fedora, Debian, SuSE and others.
Since we anyway symlink /var/run to /tmp, we can easily do the same for /run.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
