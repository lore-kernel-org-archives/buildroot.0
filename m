From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Sep 2017 22:58:07 +0200
Subject: [Buildroot] [PATCH 2/2] libkcapi: bump version to 0.14.0
In-Reply-To: <1506061220-30790-2-git-send-email-marcin.nowakowski@imgtec.com>
References: <1506061220-30790-1-git-send-email-marcin.nowakowski@imgtec.com>
 <1506061220-30790-2-git-send-email-marcin.nowakowski@imgtec.com>
Message-ID: <88839c2d-2e62-ea81-2c33-26f93e15e4a9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-09-17 08:20, Marcin Nowakowski wrote:
> Switch from github hash to an official release
> Several upstream patches are required to build the code correctly
> on all platforms supported by buildroot.
> 
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>

 Applied both to master, thanks. However, I squashed them in a single commit
because the fork() was only introduced with the version bump.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
