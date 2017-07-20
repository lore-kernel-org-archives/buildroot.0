From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jul 2017 22:41:03 +0200
Subject: [Buildroot] buildroot | Pipeline #10045873 has failed for
 2017.05.x | 786d15a2
In-Reply-To: <59707d9eeee0a_de2b3fa2d43673cc1423a@sidekiq-asap05.mail>
References: <59707d9eeee0a_de2b3fa2d43673cc1423a@sidekiq-asap05.mail>
Message-ID: <4a565636-d087-b736-c364-7988f6407aa6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-07-17 11:53, GitLab wrote:
[snip]
> E: Failed to fetch http://deb.debian.org/debian/pool/main/s/serf/libserf-1-1_1.3.9-3_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.51 80]
> E: Failed to fetch http://deb.debian.org/debian/pool/main/s/subversion/libsvn1_1.9.5-1_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.51 80]
> E: Failed to fetch http://deb.debian.org/debian/pool/main/m/mercurial/mercurial-common_4.0-1_all.deb  503  Service Temporarily Unavailable [IP: 52.84.26.51 80]
> E: Failed to fetch http://deb.debian.org/debian/pool/main/m/mercurial/mercurial_4.0-1_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.51 80]
> E: Failed to fetch http://deb.debian.org/debian/pool/main/r/rsync/rsync_3.1.2-1_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.51 80]
> E: Failed to fetch http://deb.debian.org/debian/pool/main/s/subversion/subversion_1.9.5-1_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.51 80]
> E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.51 80]
> E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
> ERROR: Job failed: exit code 1

 To avoid this in the future, perhaps you should cherry-pick
commit d2a151cea0a9066015b9e6c1fb714a84faffec0f
Author: Arnout Vandecappelle <arnout@mind.be>
Date:   Sun Jul 2 18:24:59 2017

    .gitlab-ci.yml: use the Buildroot CI image published on Docker Hub

 Regards,
 Arnout

> 
> GitLab
> Manage all notifications <https://gitlab.com/profile/notifications> ? Help
> <https://gitlab.com/help>
> You're receiving this email because of your account on gitlab.com
> <https://gitlab.com/>.
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
